// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCreditsHash() => r'3a2334b01572d964442c6bcaad602df7be805046';

/// See also [getCredits].
@ProviderFor(getCredits)
final getCreditsProvider =
    AutoDisposeFutureProvider<List<CreditModel>>.internal(
  getCredits,
  name: r'getCreditsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCreditsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCreditsRef = AutoDisposeFutureProviderRef<List<CreditModel>>;
String _$getDebitsHash() => r'2eb85e311d215892f4f64ad9eb01347923419efc';

/// See also [getDebits].
@ProviderFor(getDebits)
final getDebitsProvider = AutoDisposeFutureProvider<List<DebitModel>>.internal(
  getDebits,
  name: r'getDebitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDebitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDebitsRef = AutoDisposeFutureProviderRef<List<DebitModel>>;
String _$getAllTransactionsHash() =>
    r'df6fc958d56178b4a205c02c5084a3a5f42c5d38';

/// See also [getAllTransactions].
@ProviderFor(getAllTransactions)
final getAllTransactionsProvider =
    AutoDisposeFutureProvider<List<ITransactionModel>>.internal(
  getAllTransactions,
  name: r'getAllTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllTransactionsRef
    = AutoDisposeFutureProviderRef<List<ITransactionModel>>;
String _$updateDebitHash() => r'497663f8802512bde7a0a1fa676f5eefdf7c9ad7';

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

/// See also [updateDebit].
@ProviderFor(updateDebit)
const updateDebitProvider = UpdateDebitFamily();

/// See also [updateDebit].
class UpdateDebitFamily extends Family<AsyncValue<bool>> {
  /// See also [updateDebit].
  const UpdateDebitFamily();

  /// See also [updateDebit].
  UpdateDebitProvider call(
    DebitModel debit,
  ) {
    return UpdateDebitProvider(
      debit,
    );
  }

  @override
  UpdateDebitProvider getProviderOverride(
    covariant UpdateDebitProvider provider,
  ) {
    return call(
      provider.debit,
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
  String? get name => r'updateDebitProvider';
}

/// See also [updateDebit].
class UpdateDebitProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateDebit].
  UpdateDebitProvider(
    DebitModel debit,
  ) : this._internal(
          (ref) => updateDebit(
            ref as UpdateDebitRef,
            debit,
          ),
          from: updateDebitProvider,
          name: r'updateDebitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDebitHash,
          dependencies: UpdateDebitFamily._dependencies,
          allTransitiveDependencies:
              UpdateDebitFamily._allTransitiveDependencies,
          debit: debit,
        );

  UpdateDebitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.debit,
  }) : super.internal();

  final DebitModel debit;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateDebitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateDebitProvider._internal(
        (ref) => create(ref as UpdateDebitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        debit: debit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateDebitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDebitProvider && other.debit == debit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateDebitRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `debit` of this provider.
  DebitModel get debit;
}

class _UpdateDebitProviderElement extends AutoDisposeFutureProviderElement<bool>
    with UpdateDebitRef {
  _UpdateDebitProviderElement(super.provider);

  @override
  DebitModel get debit => (origin as UpdateDebitProvider).debit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
