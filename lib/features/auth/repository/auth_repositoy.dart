import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/user_model.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';

part 'auth_repositoy.g.dart';

@Riverpod(keepAlive: true)
AuthRepositoy authRepositoy(AuthRepositoyRef ref) => AuthRepositoy(
      firebaseAuth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider),
      firestore: ref.read(firestoreProvider),
    );

class AuthRepositoy {
  const AuthRepositoy({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  })  : _auth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  CollectionReference get _usersCollection => _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChanged => _auth.authStateChanges();

  FutureEither<UserModel> signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);

      late UserModel foundUser;
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if (isNewUser) {
        foundUser = UserModel(
          name: userCredential.user?.displayName ?? 'Untitled',
          displayImage: userCredential.user?.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          isAuthinticated: true,
          uid: userCredential.user!.uid,
          karma: 0,
          awards: [],
        );
        await _usersCollection.doc(foundUser.uid).set(foundUser.toJson());
      } else {
        foundUser = await getUserData(userCredential.user!.uid).first;
      }

      return right(foundUser);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _usersCollection.doc(uid).snapshots().map((event) => UserModel.fromJson(event.data() as JsonMap));
  }
}
