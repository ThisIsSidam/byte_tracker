import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/extensions/dart_ext.dart';
import '../../../../app/typedefs.dart';
import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';
import '../../../transactions/data/models/transaction_model.dart';

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

@riverpod
Future<num> getTodaysSpend(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);
  final DateTime now = DateTime.now();
  final Response<JSON> response = await apiService.request<JSON>(
    '/api/debits-filter',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
      'after': DateTime(
        now.year,
        now.month,
        now.day,
      ).millisecondsSinceEpoch,
    },
  );

  if (response.data != null) {
    final List<JSON> list =
        (response.data!['data'] as List<dynamic>).cast<JSON>();
    final List<DebitModel> debits = list.tryMap(DebitModel.fromJson);
    return debits.fold<num>(0, (num previousValue, DebitModel element) {
      return previousValue + element.costs;
    });
  } else {
    throw Exception('Failed to fetch gross debit');
  }
}
