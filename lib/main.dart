import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/router.dart';
import 'app/routes_builder.dart';
import 'features/app_startup/presentation/provider/app_startup_provider.dart';
import 'features/app_startup/presentation/provider/initial_screen_provider.dart';
import 'features/app_startup/presentation/screens/splash_screen.dart';
import 'features/authentication/presentation/screens/sign_in_screen.dart';
import 'features/dashboard/presentation/screens/app_dashboard.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appStartupProvider, (_, __) {});
    final AppRoute? route = ref.watch(initialScreenProvider);
    final Widget currentScreen = route == null
        ? const SplashScreen()
        : route == AppRoute.signIn
            ? const SignInScreen()
            : route == AppRoute.dashboardHome
                ? const AppDashboard()
                : _buildErrorScreen(ref);
    return MaterialApp(
      routes: appRoutes(),
      home: currentScreen,
    );
  }

  Widget _buildErrorScreen(WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Something went Wrong!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.invalidate(appStartupProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
