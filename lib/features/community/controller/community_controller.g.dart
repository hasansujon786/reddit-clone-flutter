// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCommunitiesHash() => r'63385c99e7768ac076f21c29b0ef7674e4aded3a';

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
String _$getCommunityByNameHash() =>
    r'cdf42c564dbf22c7d7f165f43af7ba9459525279';

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

/// See also [getCommunityByName].
@ProviderFor(getCommunityByName)
const getCommunityByNameProvider = GetCommunityByNameFamily();

/// See also [getCommunityByName].
class GetCommunityByNameFamily extends Family<AsyncValue<Community>> {
  /// See also [getCommunityByName].
  const GetCommunityByNameFamily();

  /// See also [getCommunityByName].
  GetCommunityByNameProvider call(
    String communityName,
  ) {
    return GetCommunityByNameProvider(
      communityName,
    );
  }

  @override
  GetCommunityByNameProvider getProviderOverride(
    covariant GetCommunityByNameProvider provider,
  ) {
    return call(
      provider.communityName,
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
  String? get name => r'getCommunityByNameProvider';
}

/// See also [getCommunityByName].
class GetCommunityByNameProvider extends StreamProvider<Community> {
  /// See also [getCommunityByName].
  GetCommunityByNameProvider(
    String communityName,
  ) : this._internal(
          (ref) => getCommunityByName(
            ref as GetCommunityByNameRef,
            communityName,
          ),
          from: getCommunityByNameProvider,
          name: r'getCommunityByNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommunityByNameHash,
          dependencies: GetCommunityByNameFamily._dependencies,
          allTransitiveDependencies:
              GetCommunityByNameFamily._allTransitiveDependencies,
          communityName: communityName,
        );

  GetCommunityByNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.communityName,
  }) : super.internal();

  final String communityName;

  @override
  Override overrideWith(
    Stream<Community> Function(GetCommunityByNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommunityByNameProvider._internal(
        (ref) => create(ref as GetCommunityByNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        communityName: communityName,
      ),
    );
  }

  @override
  StreamProviderElement<Community> createElement() {
    return _GetCommunityByNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommunityByNameProvider &&
        other.communityName == communityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, communityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCommunityByNameRef on StreamProviderRef<Community> {
  /// The parameter `communityName` of this provider.
  String get communityName;
}

class _GetCommunityByNameProviderElement
    extends StreamProviderElement<Community> with GetCommunityByNameRef {
  _GetCommunityByNameProviderElement(super.provider);

  @override
  String get communityName =>
      (origin as GetCommunityByNameProvider).communityName;
}

String _$searchCommunityHash() => r'e2f346818397d0080bcb9af2f2cb4b2f193d3b29';

/// See also [searchCommunity].
@ProviderFor(searchCommunity)
const searchCommunityProvider = SearchCommunityFamily();

/// See also [searchCommunity].
class SearchCommunityFamily extends Family<AsyncValue<List<Community>>> {
  /// See also [searchCommunity].
  const SearchCommunityFamily();

  /// See also [searchCommunity].
  SearchCommunityProvider call(
    String query,
  ) {
    return SearchCommunityProvider(
      query,
    );
  }

  @override
  SearchCommunityProvider getProviderOverride(
    covariant SearchCommunityProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchCommunityProvider';
}

/// See also [searchCommunity].
class SearchCommunityProvider
    extends AutoDisposeStreamProvider<List<Community>> {
  /// See also [searchCommunity].
  SearchCommunityProvider(
    String query,
  ) : this._internal(
          (ref) => searchCommunity(
            ref as SearchCommunityRef,
            query,
          ),
          from: searchCommunityProvider,
          name: r'searchCommunityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchCommunityHash,
          dependencies: SearchCommunityFamily._dependencies,
          allTransitiveDependencies:
              SearchCommunityFamily._allTransitiveDependencies,
          query: query,
        );

  SearchCommunityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    Stream<List<Community>> Function(SearchCommunityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchCommunityProvider._internal(
        (ref) => create(ref as SearchCommunityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Community>> createElement() {
    return _SearchCommunityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCommunityProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchCommunityRef on AutoDisposeStreamProviderRef<List<Community>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchCommunityProviderElement
    extends AutoDisposeStreamProviderElement<List<Community>>
    with SearchCommunityRef {
  _SearchCommunityProviderElement(super.provider);

  @override
  String get query => (origin as SearchCommunityProvider).query;
}

String _$communityPostsHash() => r'85d4c9fcabad1dd7988d1be425f0c4b995d3470c';

/// See also [communityPosts].
@ProviderFor(communityPosts)
const communityPostsProvider = CommunityPostsFamily();

/// See also [communityPosts].
class CommunityPostsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [communityPosts].
  const CommunityPostsFamily();

  /// See also [communityPosts].
  CommunityPostsProvider call(
    String communityName,
  ) {
    return CommunityPostsProvider(
      communityName,
    );
  }

  @override
  CommunityPostsProvider getProviderOverride(
    covariant CommunityPostsProvider provider,
  ) {
    return call(
      provider.communityName,
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
  String? get name => r'communityPostsProvider';
}

/// See also [communityPosts].
class CommunityPostsProvider extends AutoDisposeStreamProvider<List<Post>> {
  /// See also [communityPosts].
  CommunityPostsProvider(
    String communityName,
  ) : this._internal(
          (ref) => communityPosts(
            ref as CommunityPostsRef,
            communityName,
          ),
          from: communityPostsProvider,
          name: r'communityPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$communityPostsHash,
          dependencies: CommunityPostsFamily._dependencies,
          allTransitiveDependencies:
              CommunityPostsFamily._allTransitiveDependencies,
          communityName: communityName,
        );

  CommunityPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.communityName,
  }) : super.internal();

  final String communityName;

  @override
  Override overrideWith(
    Stream<List<Post>> Function(CommunityPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommunityPostsProvider._internal(
        (ref) => create(ref as CommunityPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        communityName: communityName,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Post>> createElement() {
    return _CommunityPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityPostsProvider &&
        other.communityName == communityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, communityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommunityPostsRef on AutoDisposeStreamProviderRef<List<Post>> {
  /// The parameter `communityName` of this provider.
  String get communityName;
}

class _CommunityPostsProviderElement
    extends AutoDisposeStreamProviderElement<List<Post>>
    with CommunityPostsRef {
  _CommunityPostsProviderElement(super.provider);

  @override
  String get communityName => (origin as CommunityPostsProvider).communityName;
}

String _$communityControllerHash() =>
    r'd2489488f29087bbe637aca21b33efb81fb3b6b3';

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
