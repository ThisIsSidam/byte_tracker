import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/new_user.dart';

part 'new_user_provider.g.dart';

@riverpod
class NewUserState extends _$NewUserState {
  @override
  NewUser build() {
    return const NewUser();
  }

  void updateUser({
    String? email,
    String? name,
    String? aadhaar,
    String? password,
  }) {
    state = NewUser(
      email: email ?? state.email,
      password: password ?? state.password,
    );
  }
}
