// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cotroller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'6c2c3b93da1dfbb8fb143dc34583fdf1388b8076';

/// See also [User].
@ProviderFor(User)
final userProvider = AutoDisposeNotifierProvider<User, UserModel?>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = AutoDisposeNotifier<UserModel?>;
String _$authControllerHash() => r'11af275f8c37366ecf2ee3c997968ebe21c98cda';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeNotifierProvider<AuthController, bool>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
