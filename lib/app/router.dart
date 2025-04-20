enum AppRoute {
  appDashboard('/dashboard'),
  signIn('/signIn'),
  signUp('/signUp'),
  dashboardHome('/home'),
  ;

  const AppRoute(this.path);

  final String path;
}
