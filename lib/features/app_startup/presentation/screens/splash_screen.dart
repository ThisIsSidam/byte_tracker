import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/riverpod_widgets/async_widget.dart';
import '../provider/app_startup_provider.dart';

@immutable
class SplashScreen extends ConsumerWidget {
  /// [SplashScreen] is the first screen that is shown when the app starts up.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: AsyncValueWidget<String?>.orElse(
        value: ref.watch(appStartupProvider),
        skipLoadingOnRefresh: false,
        orElse: _buildLoader,
        error: (Object error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(error.toString()),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(appStartupProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }
}
