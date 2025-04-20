import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/authentication/presentation/screens/sign_up_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import 'router.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder>{
    AppRoute.signIn.path: (_) => const SignInScreen(),
    AppRoute.signUp.path: (_) => const SignUpScreen(),
    AppRoute.appDashboard.path: (_) => const DashboardScreen(),
  };
}
