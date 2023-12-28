// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCommunitiesHash() => r'e91f0f479e7eb975fab2971e47ff89ab817ab069';

/// See also [userCommunities].
@ProviderFor(userCommunities)
final userCommunitiesProvider = StreamProvider<List<Community>>.internal(
  userCommunities,
  name: r'userCommunitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userCommunitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserCommunitiesRef = StreamProviderRef<List<Community>>;
String _$communityControllerHash() =>
    r'a474030405c989f20f11d6528125ad58a5fd59b5';

/// See also [CommunityController].
@ProviderFor(CommunityController)
final communityControllerProvider =
    AutoDisposeNotifierProvider<CommunityController, bool>.internal(
  CommunityController.new,
  name: r'communityControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$communityControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CommunityController = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
