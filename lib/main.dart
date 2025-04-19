import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/authentication/presentation/providers/auth_notifier.dart';
import 'features/authentication/presentation/screens/sign_in_screen.dart';
import 'features/dashboard/presentation/screens/app_dashboard.dart';
import 'firebase_options.dart';
import 'shared/widgets/riverpod_widgets/async_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: AsyncValueWidget<AuthState>(
        value: ref.watch(authNotifierProvider),
        data: (AuthState authState) {
          return authState.isLoggedIn()
              ? const AppDashboard()
              : const SignInScreen();
        },
        error: (Object e, __) => Text('$e'),
        loading: CircularProgressIndicator.new,
      ),
    );
  }
}
