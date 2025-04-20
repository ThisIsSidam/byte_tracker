// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addGoalHash() => r'52afc3c0bada75af2794d89a951b9b75cbfb4dde';

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

/// See also [addGoal].
@ProviderFor(addGoal)
const addGoalProvider = AddGoalFamily();

/// See also [addGoal].
class AddGoalFamily extends Family<AsyncValue<bool>> {
  /// See also [addGoal].
  const AddGoalFamily();

  /// See also [addGoal].
  AddGoalProvider call(
    GoalModel newGoal,
  ) {
    return AddGoalProvider(
      newGoal,
    );
  }

  @override
  AddGoalProvider getProviderOverride(
    covariant AddGoalProvider provider,
  ) {
    return call(
      provider.newGoal,
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
  String? get name => r'addGoalProvider';
}

/// See also [addGoal].
class AddGoalProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [addGoal].
  AddGoalProvider(
    GoalModel newGoal,
  ) : this._internal(
          (ref) => addGoal(
            ref as AddGoalRef,
            newGoal,
          ),
          from: addGoalProvider,
          name: r'addGoalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addGoalHash,
          dependencies: AddGoalFamily._dependencies,
          allTransitiveDependencies: AddGoalFamily._allTransitiveDependencies,
          newGoal: newGoal,
        );

  AddGoalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newGoal,
  }) : super.internal();

  final GoalModel newGoal;

  @override
  Override overrideWith(
    FutureOr<bool> Function(AddGoalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddGoalProvider._internal(
        (ref) => create(ref as AddGoalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newGoal: newGoal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AddGoalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddGoalProvider && other.newGoal == newGoal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newGoal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddGoalRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `newGoal` of this provider.
  GoalModel get newGoal;
}

class _AddGoalProviderElement extends AutoDisposeFutureProviderElement<bool>
    with AddGoalRef {
  _AddGoalProviderElement(super.provider);

  @override
  GoalModel get newGoal => (origin as AddGoalProvider).newGoal;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
