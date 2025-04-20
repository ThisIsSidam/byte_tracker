import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/typedefs.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/new_user.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUpDB extends _$SignUpDB {
  @override
  Future<String?> build(NewUser user) async {
    final ApiService apiService = ref.read(apiServiceProvider);
    final Response<JSON> response = await apiService.request<JSON>(
      method: HttpMethod.post,
      '/user',
    );
    if (response.data != null) {
      return response.data!['id'] as String;
    }
    return null;
  }
}

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
