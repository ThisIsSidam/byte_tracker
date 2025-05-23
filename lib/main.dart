import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/router/router.dart';
import 'app/router/routes_builder.dart';
import 'app/theme/theme.dart';
import 'features/app_startup/presentation/provider/app_startup_provider.dart';
import 'features/app_startup/presentation/provider/initial_screen_provider.dart';
import 'features/app_startup/presentation/provider/sync_provider.dart';
import 'features/app_startup/presentation/screens/splash_screen.dart';
import 'features/authentication/presentation/screens/sign_in_screen.dart';
import 'features/dashboard/presentation/screens/app_dashboard.dart';
import 'features/dashboard/presentation/screens/connect_bank_screen.dart';
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
    ref.read(syncTransactionsProvider);
    ref.listen(appStartupProvider, (_, __) {});
    final AppRoute? route = ref.watch(initialScreenProvider);
    final Widget currentScreen = route == null
        ? const SplashScreen()
        : route == AppRoute.signIn
            ? const SignInScreen()
            : route == AppRoute.dashboardHome
                ? const AppDashboard()
                : route == AppRoute.connectBank
                    ? const ConnectBankScreen()
                    : _buildErrorScreen(ref);
    return MaterialApp(
      routes: appRoutes(),
      home: currentScreen,
      theme: lightTheme,
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
