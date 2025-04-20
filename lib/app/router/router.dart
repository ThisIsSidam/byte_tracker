enum AppRoute {
  appDashboard('/dashboard'),
  signIn('/signIn'),
  signUp('/signUp'),
  dashboardHome('/home'),
  connectBank('connectBank'),
  ;

  const AppRoute(this.path);

  final String path;
}
