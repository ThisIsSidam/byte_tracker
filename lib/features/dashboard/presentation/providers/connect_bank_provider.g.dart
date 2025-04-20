// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_bank_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectToBankHash() => r'aae64303a9b7ac7381c9a387222947e4f273d6d3';

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

/// See also [connectToBank].
@ProviderFor(connectToBank)
const connectToBankProvider = ConnectToBankFamily();

/// See also [connectToBank].
class ConnectToBankFamily extends Family<AsyncValue<bool>> {
  /// See also [connectToBank].
  const ConnectToBankFamily();

  /// See also [connectToBank].
  ConnectToBankProvider call(
    String firstName,
    String lastName,
    String aadhaar,
  ) {
    return ConnectToBankProvider(
      firstName,
      lastName,
      aadhaar,
    );
  }

  @override
  ConnectToBankProvider getProviderOverride(
    covariant ConnectToBankProvider provider,
  ) {
    return call(
      provider.firstName,
      provider.lastName,
      provider.aadhaar,
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
  String? get name => r'connectToBankProvider';
}

/// See also [connectToBank].
class ConnectToBankProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [connectToBank].
  ConnectToBankProvider(
    String firstName,
    String lastName,
    String aadhaar,
  ) : this._internal(
          (ref) => connectToBank(
            ref as ConnectToBankRef,
            firstName,
            lastName,
            aadhaar,
          ),
          from: connectToBankProvider,
          name: r'connectToBankProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$connectToBankHash,
          dependencies: ConnectToBankFamily._dependencies,
          allTransitiveDependencies:
              ConnectToBankFamily._allTransitiveDependencies,
          firstName: firstName,
          lastName: lastName,
          aadhaar: aadhaar,
        );

  ConnectToBankProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.firstName,
    required this.lastName,
    required this.aadhaar,
  }) : super.internal();

  final String firstName;
  final String lastName;
  final String aadhaar;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ConnectToBankRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConnectToBankProvider._internal(
        (ref) => create(ref as ConnectToBankRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        firstName: firstName,
        lastName: lastName,
        aadhaar: aadhaar,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ConnectToBankProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConnectToBankProvider &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.aadhaar == aadhaar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, firstName.hashCode);
    hash = _SystemHash.combine(hash, lastName.hashCode);
    hash = _SystemHash.combine(hash, aadhaar.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConnectToBankRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `firstName` of this provider.
  String get firstName;

  /// The parameter `lastName` of this provider.
  String get lastName;

  /// The parameter `aadhaar` of this provider.
  String get aadhaar;
}

class _ConnectToBankProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ConnectToBankRef {
  _ConnectToBankProviderElement(super.provider);

  @override
  String get firstName => (origin as ConnectToBankProvider).firstName;
  @override
  String get lastName => (origin as ConnectToBankProvider).lastName;
  @override
  String get aadhaar => (origin as ConnectToBankProvider).aadhaar;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
