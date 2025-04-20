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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
