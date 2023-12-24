// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cotroller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangedHash() => r'1d2a11e039a0ec003bf2e61aa431c06e7db430b2';

/// See also [authStateChanged].
@ProviderFor(authStateChanged)
final authStateChangedProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChanged,
  name: r'authStateChangedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangedRef = AutoDisposeStreamProviderRef<User?>;
String _$getUserDataHash() => r'e55eef7850646457bdee8486918fac281071e3fa';

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

/// See also [getUserData].
@ProviderFor(getUserData)
const getUserDataProvider = GetUserDataFamily();

/// See also [getUserData].
class GetUserDataFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [getUserData].
  const GetUserDataFamily();

  /// See also [getUserData].
  GetUserDataProvider call(
    String uid,
  ) {
    return GetUserDataProvider(
      uid,
    );
  }

  @override
  GetUserDataProvider getProviderOverride(
    covariant GetUserDataProvider provider,
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
  String? get name => r'getUserDataProvider';
}

/// See also [getUserData].
class GetUserDataProvider extends AutoDisposeStreamProvider<UserModel?> {
  /// See also [getUserData].
  GetUserDataProvider(
    String uid,
  ) : this._internal(
          (ref) => getUserData(
            ref as GetUserDataRef,
            uid,
          ),
          from: getUserDataProvider,
          name: r'getUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDataHash,
          dependencies: GetUserDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserDataFamily._allTransitiveDependencies,
          uid: uid,
        );

  GetUserDataProvider._internal(
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
    Stream<UserModel?> Function(GetUserDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserDataProvider._internal(
        (ref) => create(ref as GetUserDataRef),
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
  AutoDisposeStreamProviderElement<UserModel?> createElement() {
    return _GetUserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserDataRef on AutoDisposeStreamProviderRef<UserModel?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _GetUserDataProviderElement
    extends AutoDisposeStreamProviderElement<UserModel?> with GetUserDataRef {
  _GetUserDataProviderElement(super.provider);

  @override
  String get uid => (origin as GetUserDataProvider).uid;
}

String _$signedInUserHash() => r'68bf460941e9f5aec34400340a94e2b1293a307c';

/// See also [SignedInUser].
@ProviderFor(SignedInUser)
final signedInUserProvider =
    AutoDisposeNotifierProvider<SignedInUser, UserModel?>.internal(
  SignedInUser.new,
  name: r'signedInUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signedInUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignedInUser = AutoDisposeNotifier<UserModel?>;
String _$authControllerHash() => r'6020ee510cc99148e062d2de9f8999fa3770b7ea';

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
