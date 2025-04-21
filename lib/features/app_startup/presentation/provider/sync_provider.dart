import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/typedefs.dart';
import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';

part 'sync_provider.g.dart';

@riverpod
Future<bool> syncTransactions(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);

  final Response<JSON> response = await apiService.request<JSON>(
    '/api/sync-transactions',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  return response.statusCode == 200;
}
