enum AppRoute {
  dashboard('/dashboard'),
  signIn('/signIn'),
  home('/home'),
  ;

  const AppRoute(this.path);

  final String path;
}
