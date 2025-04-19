import 'package:flutter/material.dart';

import '../../animations/dots_loader.dart';

@immutable
class LoadingButton extends StatelessWidget {
  /// Creates a loading button with a child widget
  const LoadingButton({
    super.key,
    this.onPressed,
    this.child,
    this.loaderColor,
    this.style,
    this.loader,
    this.isLoading = false,
    this.enabled = true,
  })  : icon = null,
        label = null;

  /// Creates a loading button with an icon and a label
  LoadingButton.icon({
    required Widget this.icon,
    super.key,
    this.onPressed,
    this.loaderColor,
    this.label,
    this.style,
    this.loader,
    this.isLoading = false,
    this.enabled = true,
  }) : child = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            const SizedBox(width: 8),
            if (label != null) label,
          ],
        );

  final Widget? child;
  final Widget? icon;
  final Widget? label;
  final bool enabled;
  final bool isLoading;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Widget? loader;
  final Color? loaderColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: style,
      onPressed: isLoading || !enabled ? null : onPressed,
      child: isLoading ? _buildLoader(colorScheme) : child,
    );
  }

  /// Builds the loader
  SizedBox _buildLoader(ColorScheme colorScheme) {
    return SizedBox.square(
      dimension: 24,
      child: loader ?? _dotsLoader(colorScheme),
    );
  }

  /// Returns the default loader
  DotsLoader _dotsLoader(ColorScheme colorScheme) =>
      DotsLoader(size: 30, color: loaderColor ?? colorScheme.primary);
}
