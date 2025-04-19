/// Configs enum
enum Configs {
  dev._('Urdoer [DEV]'),
  prod._('Urdoer');

  const Configs._(this.title);

  final String title;

  static String baseURL1 = const String.fromEnvironment('BASE_URL_1');
}
