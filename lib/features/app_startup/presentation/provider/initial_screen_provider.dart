import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/router.dart';

part 'initial_screen_provider.g.dart';

@riverpod
class InitialScreen extends _$InitialScreen {
  @override
  AppRoute? build() {
    return null;
  }

  set updateRoute(AppRoute? newRoute) {
    state = newRoute;
  }
}
