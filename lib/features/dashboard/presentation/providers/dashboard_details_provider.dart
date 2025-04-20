import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/typedefs.dart';
import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';

part 'dashboard_details_provider.g.dart';

@riverpod
Future<num> getGrossCredit(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);
  final Response<JSON> response = await apiService.request<JSON>(
    '/api/total-credit',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  if (response.data != null) {
    return response.data!['totalCredit'] as num;
  } else {
    throw Exception('Failed to fetch gross credit');
  }
}

@riverpod
Future<num> getGrossDebit(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);
  final Response<JSON> response = await apiService.request<JSON>(
    '/api/total-debit',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  if (response.data != null) {
    return response.data!['totalDebit'] as num;
  } else {
    throw Exception('Failed to fetch gross debit');
  }
}
