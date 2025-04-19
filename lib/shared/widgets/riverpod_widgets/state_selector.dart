import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef StateSelectorRefBuilder<S> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  S value,
  Widget? child,
);

typedef StateSelectorBuilder<S> = Widget Function(
  BuildContext context,
  S value,
  Widget? child,
);

@immutable
class StateSelector<T, S> extends ConsumerWidget {
  /// A widget that builds itself based on the latest value of a
  /// specified [provider] and a [selector].
  const StateSelector({
    required this.provider,
    required this.selector,
    required StateSelectorBuilder<S> this.builder,
    this.listener,
    super.key,
    this.child,
  }) : refBuilder = null;

  /// StateSelector with ref instance
  const StateSelector.ref({
    required this.provider,
    required this.selector,
    required StateSelectorRefBuilder<S> this.refBuilder,
    this.listener,
    this.child,
    super.key,
  }) : builder = null;

  final ProviderBase<T> provider;
  final S Function(T value) selector;
  final StateSelectorBuilder<S>? builder;
  final void Function(S? previous, S next)? listener;
  final StateSelectorRefBuilder<S>? refBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (listener != null) {
      ref.listen<T>(provider, (T? previous, T next) {
        final S nxt = selector(next);
        if (previous != null) {
          listener!(selector(previous), nxt);
        } else {
          listener!(null, nxt);
        }
      });
    }
    final S state = ref.watch(provider.select(selector));
    if (builder != null) return builder!(context, state, child);
    return refBuilder!(context, ref, state, child);
  }
}
