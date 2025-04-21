import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/typedefs.dart';
import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';
import '../../data/model/goal_model.dart';

part 'goal_providers.g.dart';

@riverpod
Future<bool> addGoal(Ref ref, GoalModel newGoal) async {
  final AppUser user = ref.watch(appUserProvider).value!;
  final ApiService apiService = ref.watch(apiServiceProvider);

  final Map<String, dynamic> data = <String, dynamic>{
    'isShortTerm': newGoal.isShortTermed,
    'priority': newGoal.priority,
    'title': newGoal.title,
    'amount': newGoal.amount,
    'remainderAt': newGoal.remaindAt.millisecondsSinceEpoch,
  };

  final Response<JSON> response = await apiService.request<JSON>(
    '/api/goals',
    method: HttpMethod.post,
    data: data,
    queryParams: <String, dynamic>{
      'id': user.id,
    },
  );

  if (response.data != null) {
    return true;
  } else {
    throw Exception('Failed to add goal');
  }
}
