import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/typedefs.dart';
import '../data/models/app_user_model.dart';
import '../services/api_service.dart';
import 'global_providers.dart';

part 'app_user_provider.g.dart';

@riverpod
Future<AppUser?> appUser(Ref ref) async {
  final ApiService apiService = ref.watch(apiServiceProvider);
  final Response<JSON> response = await apiService.request<JSON>(
    '/user',
    method: HttpMethod.get,
  );
  if (response.data != null) {
    return AppUser.fromJson(response.data!);
  }
  return null;
}
