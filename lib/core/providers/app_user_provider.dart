import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/typedefs.dart';
import '../data/models/app_user_model.dart';
import '../services/api_service.dart';
import 'global_providers.dart';

part 'app_user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<AppUser?> appUser(Ref ref) async {
  final String? customId = await ref.watch(userIdFromFirebaseProvider.future);

  if (customId == null) {
    return null;
  }

  final ApiService apiService = ref.watch(apiServiceProvider);
  final Response<JSON> response = await apiService.request<JSON>(
    '/api/',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': customId,
    },
  );
  if (response.data != null) {
    return AppUser.fromJson(response.data!);
  }
  return null;
}
