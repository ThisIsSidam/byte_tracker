import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transactions/data/models/transaction_model.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
abstract class GoalModel with _$GoalModel {
  const factory GoalModel({
    required bool isShortTermed,
    required int priority,
    required String title,
    required double amount,
    required double currentlySaved,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime remaindAt,
  }) = _GoalModel;

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);
}
