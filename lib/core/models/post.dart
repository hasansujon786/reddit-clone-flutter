import 'package:freezed_annotation/freezed_annotation.dart';

import 'community.dart';
import 'user_model.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String title,
    required String type,
    required String? link,
    required String? description,
    required DateTime createdAt,
    required List<String> upvotes,
    required List<String> downvotes,
    required List<String> awards,
    required int commentCount,
    // Community
    required String communityName,
    required String communityAvater,
    // User
    required String userName,
    required String uid,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

  factory Post.generateNewPost({
    required String id,
    required String title,
    required String type,
    required String? link,
    required String? description,
    required Community community,
    required UserModel user,
  }) {
    return Post(
      id: id,
      title: title,
      type: type,
      link: link,
      description: description,
      createdAt: DateTime.now(),
      upvotes: [],
      downvotes: [],
      awards: [],
      commentCount: 0,
      // Community
      communityName: community.name,
      communityAvater: community.avater,
      // User
      uid: user.uid,
      userName: user.name,
    );
  }
}
