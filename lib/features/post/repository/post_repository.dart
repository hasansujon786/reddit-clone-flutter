import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/community.dart';
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

  Stream<List<Post>> fetchUserFeed(List<Community> communities) {
    return _postCollection
        .where('communityName', whereIn: communities.map((e) => e.name).toList())
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => Post.fromJson(e.data() as JsonMap)).toList());
  }

  Stream<List<Post>> searchPostByAFeild(String feildName, String feildValue) {
    return _postCollection
        .where(feildName, isEqualTo: feildValue)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => Post.fromJson(e.data() as JsonMap)).toList());
  }

  FutureEitherVoid deleteAPost(Post post) async {
    try {
      return right(_postCollection.doc(post.id).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  void upvoteAPost(Post post, String userId) {
    Map<String, FieldValue> voteData = {};

    if (post.downvotes.contains(userId)) {
      voteData['downvotes'] = FieldValue.arrayRemove([userId]);
    }

    if (post.upvotes.contains(userId)) {
      voteData['upvotes'] = FieldValue.arrayRemove([userId]);
    } else {
      voteData['upvotes'] = FieldValue.arrayUnion([userId]);
    }

    _postCollection.doc(post.id).update(voteData);
  }

  void downVoteAPost(Post post, String userId) {
    Map<String, FieldValue> voteData = {};

    if (post.upvotes.contains(userId)) {
      voteData['upvotes'] = FieldValue.arrayRemove([userId]);
    }

    if (post.downvotes.contains(userId)) {
      voteData['downvotes'] = FieldValue.arrayRemove([userId]);
    } else {
      voteData['downvotes'] = FieldValue.arrayUnion([userId]);
    }

    _postCollection.doc(post.id).update(voteData);
  }
}
