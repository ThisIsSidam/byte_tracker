import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
abstract class GoalModel with _$GoalModel {
  const factory GoalModel({
    required bool isShortTerm,
    required int priority,
    required String title,
    required double amount,
    required double currentlySaved,
    required DateTime createdAt,
    required DateTime reminderAt,
  }) = _GoalModel;

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);
}
