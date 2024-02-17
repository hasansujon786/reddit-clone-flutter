// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFeedHash() => r'092a6335e460ed6955704a7dfdaa26f0f5e10b0e';

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

/// See also [userFeed].
@ProviderFor(userFeed)
const userFeedProvider = UserFeedFamily();

/// See also [userFeed].
class UserFeedFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [userFeed].
  const UserFeedFamily();

  /// See also [userFeed].
  UserFeedProvider call(
    List<Community> communities,
  ) {
    return UserFeedProvider(
      communities,
    );
  }

  @override
  UserFeedProvider getProviderOverride(
    covariant UserFeedProvider provider,
  ) {
    return call(
      provider.communities,
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
  String? get name => r'userFeedProvider';
}

/// See also [userFeed].
class UserFeedProvider extends AutoDisposeStreamProvider<List<Post>> {
  /// See also [userFeed].
  UserFeedProvider(
    List<Community> communities,
  ) : this._internal(
          (ref) => userFeed(
            ref as UserFeedRef,
            communities,
          ),
          from: userFeedProvider,
          name: r'userFeedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFeedHash,
          dependencies: UserFeedFamily._dependencies,
          allTransitiveDependencies: UserFeedFamily._allTransitiveDependencies,
          communities: communities,
        );

  UserFeedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.communities,
  }) : super.internal();

  final List<Community> communities;

  @override
  Override overrideWith(
    Stream<List<Post>> Function(UserFeedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserFeedProvider._internal(
        (ref) => create(ref as UserFeedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        communities: communities,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Post>> createElement() {
    return _UserFeedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFeedProvider && other.communities == communities;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, communities.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserFeedRef on AutoDisposeStreamProviderRef<List<Post>> {
  /// The parameter `communities` of this provider.
  List<Community> get communities;
}

class _UserFeedProviderElement
    extends AutoDisposeStreamProviderElement<List<Post>> with UserFeedRef {
  _UserFeedProviderElement(super.provider);

  @override
  List<Community> get communities => (origin as UserFeedProvider).communities;
}

String _$postControllerHash() => r'c32a5997774faf52621000544186d56e03bdef83';

/// See also [PostController].
@ProviderFor(PostController)
final postControllerProvider =
    AutoDisposeNotifierProvider<PostController, bool>.internal(
  PostController.new,
  name: r'postControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostController = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
