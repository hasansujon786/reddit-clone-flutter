import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/constants/constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/community.dart';
import '../../../core/providers/storage_repository_provider.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../repository/community_repository.dart';

part 'community_controller.g.dart';

@riverpod
class CommunityController extends _$CommunityController {
  late final _communityRepository = ref.read(communityRepositoryProvider);
  late final _storageRepository = ref.read(storageRepositoryProvider);

  @override
  bool build() {
    return false;
  }

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = ref.read(signedInUserProvider)?.uid ?? '';
    final community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avater: Constants.avatarDefault,
      members: [uid],
      mods: [uid],
    );

    final res = await _communityRepository.createCommunity(community);
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Community created successfully.');
      Routemaster.of(context).pop();
    });
  }

  Stream<List<Community>> getUserCommunities() {
    final uid = ref.read(signedInUserProvider)?.uid ?? '';
    return _communityRepository.getUserCommunities(uid);
  }

  // TODO: Learn how to handle error in stream
  Stream<Community> getCommunityByName(String name) {
    return _communityRepository.getCommunityByName(name);
  }

  Future<void> editCommunity({
    required BuildContext context,
    required Community community,
    required File? avaterFile,
    required File? bannerFile,
  }) async {
    state = true;
    if (avaterFile != null) {
      final res = await _storageRepository.storeFile(
        id: community.name,
        file: avaterFile,
        path: 'communities/avater',
      );
      res.fold((l) => showSnackBar(context, l.message), (r) {
        community = community.copyWith(avater: r);
      });
    }

    if (bannerFile != null) {
      final res = await _storageRepository.storeFile(
        id: community.name,
        file: bannerFile,
        path: 'communities/banner',
      );
      res.fold((l) => showSnackBar(context, l.message), (r) {
        community = community.copyWith(banner: r);
      });
    }

    final res = await _communityRepository.editCommunity(community);

    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      Routemaster.of(context).pop();
    });
  }

  void joinOrLeaveCommunity(Community community, BuildContext context) async {
    final uid = ref.read(signedInUserProvider)?.uid ?? '';

    String msg;
    Either<Failure, void> res;
    if (community.members.contains(uid)) {
      msg = 'Community left successfully.';
      res = await _communityRepository.leaveCommunity(community.name, uid);
    } else {
      msg = 'Community joined successfully.';
      res = await _communityRepository.joinCommunity(community.name, uid);
    }

    res.fold((l) => showSnackBar(context, l.message), (r) => showSnackBar(context, msg));
  }

  Stream<List<Community>> searchCommunity(String query) {
    return _communityRepository.searchCommunity(query);
  }
}

@Riverpod(keepAlive: true)
Stream<List<Community>> userCommunities(UserCommunitiesRef ref) {
  return ref.read(communityControllerProvider.notifier).getUserCommunities();
}

@Riverpod(keepAlive: true)
Stream<Community> getCommunityByName(GetCommunityByNameRef ref, String communityName) {
  return ref.read(communityControllerProvider.notifier).getCommunityByName(communityName);
}

@riverpod
Stream<List<Community>> searchCommunity(SearchCommunityRef ref, String query) {
  return ref.watch(communityControllerProvider.notifier).searchCommunity(query);
}
