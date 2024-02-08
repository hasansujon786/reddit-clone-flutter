import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/post.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(firestore: ref.read(firestoreProvider));
}

class PostRepository {
  const PostRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference get _postCollection => _firestore.collection(FirebaseConstants.postsCollection);

  FutureEitherVoid addPost(Post post) async {
    try {
      return right(_postCollection.doc(post.id).set(post.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
