import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/constants/constants.dart';
import '../../../core/models/community.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../repository/community_repository.dart';

part 'community_controller.g.dart';

@riverpod
class CommunityController extends _$CommunityController {
  late final _communityRepository = ref.read(communityRepositoryProvider);

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

  Stream<List<Community>> getUserCommunityies() {
    final uid = ref.read(signedInUserProvider)?.uid ?? '';
    return _communityRepository.getUserCommunityies(uid);
  }
}

@Riverpod(keepAlive: true)
Stream<List<Community>> userCommunities(UserCommunitiesRef ref) {
  return ref.read(communityControllerProvider.notifier).getUserCommunityies();
}
