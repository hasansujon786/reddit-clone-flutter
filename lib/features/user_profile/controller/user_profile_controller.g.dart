// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserPostsHash() => r'c12d3266f1e7f1b805617e6073ad130b3caf9de1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getUserPosts].
@ProviderFor(getUserPosts)
const getUserPostsProvider = GetUserPostsFamily();

/// See also [getUserPosts].
class GetUserPostsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [getUserPosts].
  const GetUserPostsFamily();

  /// See also [getUserPosts].
  GetUserPostsProvider call(
    String uid,
  ) {
    return GetUserPostsProvider(
      uid,
    );
  }

  @override
  GetUserPostsProvider getProviderOverride(
    covariant GetUserPostsProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserPostsProvider';
}

/// See also [getUserPosts].
class GetUserPostsProvider extends AutoDisposeStreamProvider<List<Post>> {
  /// See also [getUserPosts].
  GetUserPostsProvider(
    String uid,
  ) : this._internal(
          (ref) => getUserPosts(
            ref as GetUserPostsRef,
            uid,
          ),
          from: getUserPostsProvider,
          name: r'getUserPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserPostsHash,
          dependencies: GetUserPostsFamily._dependencies,
          allTransitiveDependencies:
              GetUserPostsFamily._allTransitiveDependencies,
          uid: uid,
        );

  GetUserPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<List<Post>> Function(GetUserPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserPostsProvider._internal(
        (ref) => create(ref as GetUserPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Post>> createElement() {
    return _GetUserPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserPostsProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserPostsRef on AutoDisposeStreamProviderRef<List<Post>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _GetUserPostsProviderElement
    extends AutoDisposeStreamProviderElement<List<Post>> with GetUserPostsRef {
  _GetUserPostsProviderElement(super.provider);

  @override
  String get uid => (origin as GetUserPostsProvider).uid;
}

String _$userProfileControllerHash() =>
    r'ea336b427fa2000f1c816b6a9fec1d489ce7f44b';

/// See also [UserProfileController].
@ProviderFor(UserProfileController)
final userProfileControllerProvider =
    AutoDisposeNotifierProvider<UserProfileController, bool>.internal(
  UserProfileController.new,
  name: r'userProfileControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserProfileController = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
