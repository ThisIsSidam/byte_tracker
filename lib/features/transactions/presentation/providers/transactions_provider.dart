import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/extensions/dart_ext.dart';
import '../../../../app/typedefs.dart';
import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';
import '../../data/models/transaction_model.dart';

part 'transactions_provider.g.dart';

@riverpod
Future<List<CreditModel>> getCredits(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);

  final Response<JSON> response = await apiService.request<JSON>(
    '/api/list-credit',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  if (response.data != null) {
    final List<JSON> list =
        (response.data!['credits'] as List<dynamic>).cast<JSON>();
    return list.tryMap(CreditModel.fromJson);
  } else {
    throw Exception('Failed to fetch credits');
  }
}

@riverpod
Future<List<DebitModel>> getDebits(Ref ref) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);

  final Response<JSON> response = await apiService.request<JSON>(
    '/api/list-debit',
    method: HttpMethod.get,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  if (response.data != null) {
    final List<JSON> list =
        (response.data!['debits'] as List<dynamic>).cast<JSON>();
    return list.tryMap(DebitModel.fromJson);
  } else {
    throw Exception('Failed to fetch debits');
  }
}

@riverpod
Future<List<ITransactionModel>> getAllTransactions(Ref ref) async {
  final List<CreditModel> credits = await ref.watch(getCreditsProvider.future);
  final List<DebitModel> debits = await ref.watch(getDebitsProvider.future);

  final List<ITransactionModel> allTransactions = <ITransactionModel>[
    ...credits,
    ...debits,
  ]..sort(
      (ITransactionModel a, ITransactionModel b) => a.date.compareTo(b.date),
    );

  return allTransactions;
}

@riverpod
Future<bool> updateDebit(Ref ref, DebitModel debit) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);

  final Response<JSON> response = await apiService.request<JSON>(
    '/api/update-debit',
    method: HttpMethod.post,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
    data: <String, dynamic>{
      'transactionId': debit.transactionId,
      'title': debit.title,
      'category': debit.category,
      'notes': debit.notes,
    },
  );

  return response.statusCode == 200;
}
