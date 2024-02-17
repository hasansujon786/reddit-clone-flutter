import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/post.dart';
import '../../../core/models/user_model.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';
import '../../post/repository/post_repository.dart';

part 'user_profile_repository.g.dart';

@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return UserProfileRepository(
    firestore: ref.read(firestoreProvider),
    postRepository: ref.read(postRepositoryProvider),
  );
}

class UserProfileRepository {
  const UserProfileRepository({
    required FirebaseFirestore firestore,
    required PostRepository postRepository,
  })  : _firestore = firestore,
        _postRepository = postRepository;

  final FirebaseFirestore _firestore;
  final PostRepository _postRepository;

  CollectionReference get _userCollection => _firestore.collection(FirebaseConstants.usersCollection);

  FutureEitherVoid editUserProfile(UserModel user) async {
    try {
      return right(_userCollection.doc(user.uid).update(user.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Post>> getUserPosts(String uid) {
    return _postRepository.searchPostByAFeild('uid', uid);
  }
}
