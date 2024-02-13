import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';

import '../../../core/models/community.dart';
import '../../../core/models/post.dart';
import '../../../core/providers/storage_repository_provider.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../repository/post_repository.dart';

part 'post_controller.g.dart';

@riverpod
Stream<List<Post>> userFeed(UserFeedRef ref, List<Community> communities) {
  return ref.watch(postControllerProvider.notifier).fetchUserFeed(communities);
}

@riverpod
class PostController extends _$PostController {
  late final _postRepository = ref.read(postRepositoryProvider);

  @override
  bool build() {
    return false;
  }

  Stream<List<Post>> fetchUserFeed(List<Community> communities) {
    if (communities.isEmpty) {
      return Stream.value([]);
    }
    return _postRepository.fetchUserFeed(communities);
  }

  void shareLinkPost(
    BuildContext context,
    Community community, {
    required String title,
    required String link,
  }) async {
    state = true;
    final postId = const Uuid().v1();
    final user = ref.read(signedInUserProvider)!;

    final post = Post.generateNewPost(
      id: postId,
      title: title,
      type: 'link',
      link: link,
      description: null,
      community: community,
      user: user,
    );

    final res = await _postRepository.addPost(post);
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Post shared successfully');
      Routemaster.of(context).pop();
    });
  }

  void shareTextPost(
    BuildContext context,
    Community community, {
    required String title,
    required String description,
  }) async {
    state = true;
    final postId = const Uuid().v1();
    final user = ref.read(signedInUserProvider)!;

    final post = Post.generateNewPost(
      id: postId,
      title: title,
      type: 'text',
      link: null,
      description: description,
      community: community,
      user: user,
    );

    // await Future.delayed(const Duration(seconds: 10));
    final res = await _postRepository.addPost(post);
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Post shared successfully');
      Routemaster.of(context).pop();
    });
  }

  void shareImagePost(
    BuildContext context,
    Community community, {
    required String title,
    required File? imageFile,
  }) async {
    state = true;
    final postId = const Uuid().v1();
    final user = ref.read(signedInUserProvider)!;

    // upload image
    String? imagePath;
    final filePathRes = await ref.read(storageRepositoryProvider).storeFile(
          path: 'posts/${community.name}',
          id: postId,
          file: imageFile,
        );
    filePathRes.fold((l) {
      state = false;
      return showSnackBar(context, l.message);
    }, (r) => imagePath = r);

    // create post
    if (imagePath != null) {
      final post = Post.generateNewPost(
        id: postId,
        title: title,
        type: 'image',
        link: imagePath,
        description: null,
        community: community,
        user: user,
      );

      final res = await _postRepository.addPost(post);
      state = false;

      res.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Post shared successfully.');
        Routemaster.of(context).pop();
      });
    }
  }
}
