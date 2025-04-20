// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpDBHash() => r'6644b99a120d43e226a323fc33b267f8612a7455';

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

abstract class _$SignUpDB extends BuildlessAutoDisposeAsyncNotifier<String?> {
  late final NewUser user;

  FutureOr<String?> build(
    NewUser user,
  );
}

/// See also [SignUpDB].
@ProviderFor(SignUpDB)
const signUpDBProvider = SignUpDBFamily();

/// See also [SignUpDB].
class SignUpDBFamily extends Family<AsyncValue<String?>> {
  /// See also [SignUpDB].
  const SignUpDBFamily();

  /// See also [SignUpDB].
  SignUpDBProvider call(
    NewUser user,
  ) {
    return SignUpDBProvider(
      user,
    );
  }

  @override
  SignUpDBProvider getProviderOverride(
    covariant SignUpDBProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'signUpDBProvider';
}

/// See also [SignUpDB].
class SignUpDBProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SignUpDB, String?> {
  /// See also [SignUpDB].
  SignUpDBProvider(
    NewUser user,
  ) : this._internal(
          () => SignUpDB()..user = user,
          from: signUpDBProvider,
          name: r'signUpDBProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpDBHash,
          dependencies: SignUpDBFamily._dependencies,
          allTransitiveDependencies: SignUpDBFamily._allTransitiveDependencies,
          user: user,
        );

  SignUpDBProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final NewUser user;

  @override
  FutureOr<String?> runNotifierBuild(
    covariant SignUpDB notifier,
  ) {
    return notifier.build(
      user,
    );
  }

  @override
  Override overrideWith(SignUpDB Function() create) {
    return ProviderOverride(
      origin: this,
      override: SignUpDBProvider._internal(
        () => create()..user = user,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SignUpDB, String?> createElement() {
    return _SignUpDBProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpDBProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpDBRef on AutoDisposeAsyncNotifierProviderRef<String?> {
  /// The parameter `user` of this provider.
  NewUser get user;
}

class _SignUpDBProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SignUpDB, String?>
    with SignUpDBRef {
  _SignUpDBProviderElement(super.provider);

  @override
  NewUser get user => (origin as SignUpDBProvider).user;
}

String _$newUserStateHash() => r'83116e4ec9d870563df2d6ba6d55d757fcbc7f44';

/// See also [NewUserState].
@ProviderFor(NewUserState)
final newUserStateProvider =
    AutoDisposeNotifierProvider<NewUserState, NewUser>.internal(
  NewUserState.new,
  name: r'newUserStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newUserStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewUserState = AutoDisposeNotifier<NewUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
