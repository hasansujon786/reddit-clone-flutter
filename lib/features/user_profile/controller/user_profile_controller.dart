import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/models/post.dart';
import '../../../core/models/user_model.dart';
import '../../../core/providers/storage_repository_provider.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../repository/user_profile_repository.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  late final _userProfifleRepository = ref.read(userProfileRepositoryProvider);
  late final _storageRepository = ref.read(storageRepositoryProvider);

  @override
  bool build() {
    return false;
  }

  Future<void> editProfile({
    required BuildContext context,
    required UserModel updatedUser,
    required File? avaterFile,
    required File? bannerFile,
  }) async {
    state = true;
    if (avaterFile != null) {
      final res = await _storageRepository.storeFile(
        id: updatedUser.uid,
        file: avaterFile,
        path: 'users/avater',
      );
      res.fold((l) => showSnackBar(context, l.message), (r) {
        updatedUser = updatedUser.copyWith(displayImage: r);
      });
    }

    if (bannerFile != null) {
      final res = await _storageRepository.storeFile(
        id: updatedUser.uid,
        file: bannerFile,
        path: 'users/banner',
      );
      res.fold((l) => showSnackBar(context, l.message), (r) {
        updatedUser = updatedUser.copyWith(banner: r);
      });
    }

    final res = await _userProfifleRepository.editUserProfile(updatedUser);

    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      ref.read(signedInUserProvider.notifier).update((state) => updatedUser);
      Routemaster.of(context).pop();
    });
  }

  Stream<List<Post>> getUserPosts(String uid) {
    return _userProfifleRepository.getUserPosts(uid);
  }
}

@riverpod
Stream<List<Post>> getUserPosts(GetUserPostsRef ref, String uid) {
  return ref.read(userProfileControllerProvider.notifier).getUserPosts(uid);
}
