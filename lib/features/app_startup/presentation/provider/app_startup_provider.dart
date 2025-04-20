import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/router/router.dart';
import '../../../authentication/presentation/providers/auth_notifier.dart';
import 'initial_screen_provider.dart';

part 'app_startup_provider.g.dart';

/// Does all the initialization for the app
/// Returns the route-name of the app screen that should be opened
@Riverpod(keepAlive: true)
FutureOr<String?> appStartup(Ref ref) async {
  /// Set the preferred orientations to portrait
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  /// Set the error handler to report errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final AuthState authState = await ref.watch(authNotifierProvider.future);
  if (!authState.isLoggedIn()) {
    ref.read(initialScreenProvider.notifier).updateRoute = AppRoute.signIn;
    return AppRoute.signIn.path;
  }
  ref.read(initialScreenProvider.notifier).updateRoute = AppRoute.dashboardHome;
  return AppRoute.dashboardHome.path;
}
