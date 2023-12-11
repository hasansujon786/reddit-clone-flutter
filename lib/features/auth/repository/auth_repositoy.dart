import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/firebase_providers.dart';

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
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  void signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      ));
      print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }
  }
}
