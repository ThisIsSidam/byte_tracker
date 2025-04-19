import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Generic AsyncValueWidget to work with values of type T
class AsyncValueWidget<T> extends StatelessWidget {
  /// Default constructor for the [AsyncValueWidget]
  const AsyncValueWidget({
    required this.value,
    required Widget Function(T) this.data,
    required Widget Function(Object, StackTrace) this.error,
    required Widget Function() this.loading,
    super.key,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnHasValue = false,
    this.skipError = false,
  })  : orElse = null,
        mockList = null,
        skeleton = null;

  /// Named constructor for the AsyncValueWidget with orElse
  const AsyncValueWidget.orElse({
    required this.value,
    required Widget Function() this.orElse,
    this.data,
    this.error,
    this.loading,
    super.key,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnHasValue = false,
    this.skipError = false,
  })  : skeleton = null,
        mockList = null;

  /// Named constructor for the AsyncValueWidget with skeleton
  const AsyncValueWidget.skeleton({
    required this.value,
    required Widget Function(T data, bool isLoading) this.skeleton,
    required T Function() this.mockList,
    required Widget Function(Object, StackTrace) this.error,
    super.key,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnHasValue = false,
    this.skipError = false,
  })  : orElse = null,
        loading = null,
        data = null;

  /// [value] is the async value to be displayed.
  final AsyncValue<T> value;

  /// [data] is the builder function to be called when [value]
  /// is [AsyncValue.data].
  final Widget Function(T)? data;

  /// [error] is the builder function to be called when [value]
  /// is [AsyncValue.error].
  final Widget Function(Object, StackTrace)? error;

  /// [loading] is the builder function to be called when [value]
  /// is [AsyncValue.loading].
  final Widget Function()? loading;

  /// [skeleton] is the builder function to be called when [value] is either
  /// [AsyncValue.loading] or [AsyncValue.data].
  final Widget Function(T, bool isLoading)? skeleton;

  /// A generator function to create a mock value for the widget while it is
  /// loading.
  final T Function()? mockList;

  /// [skipLoadingOnReload] (false by default) customizes whether [loading]
  ///  should be invoked if a provider rebuilds because of [Ref.watch].
  ///  In that situation, [when] will try to invoke either [error]/[data]
  ///  with the previous state.
  final bool skipLoadingOnReload;

  /// [skipLoadingOnRefresh] (true by default) decides whether to invoke [data]
  /// instead of [loading] if a previous [value] is available.
  final bool skipLoadingOnRefresh;

  /// [skipError] (false by default) decides whether to invoke [data] instead
  /// of [error] if a previous [value] is available.
  final bool skipError;

  /// [skipLoadingOnHasValue] (false by default) decides whether to invoke
  /// [data] instead of [loading] if a previous [value] is available.
  final bool skipLoadingOnHasValue;

  /// [orElse] is the builder function to be called on default case
  final Widget Function()? orElse;

  @override
  Widget build(BuildContext context) {
    if (skipLoadingOnHasValue &&
        value.hasValue &&
        (value.isLoading || value.hasError)) {
      return _buildWhenValue();
    }
    return value.when(
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      data: _buildData,
      loading: _loading,
      error: (Object e, StackTrace stk) =>
          error?.call(e, stk) ?? orElse!.call(),
    );
  }

  /// Build data widget
  Widget _buildData(T data) =>
      this.data?.call(data) ?? skeleton?.call(data, false) ?? orElse!.call();

  /// Build Loading widget
  Widget _loading() =>
      loading?.call() ?? skeleton?.call(mockList!(), true) ?? orElse!.call();

  /// Builds the widget when the value is available
  Widget _buildWhenValue() {
    if (!skipLoadingOnRefresh && value.isRefreshing) return _loading();
    return _buildData(value.requireValue);
  }
}
