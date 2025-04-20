import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/goals/data/model/goal_model.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(name: '_id') required String id,
    required String firstName,
    required String lastName,
    required String aadharId,
    required String email,
    @JsonKey(name: 'grossAmount') required int grossAmount,
    @JsonKey(name: 'alertOnRemaigning') required int alertOnRemaigning,
    @JsonKey(name: 'limitForDay') required int limitForDay,
    @JsonKey(name: 'lastBankSync') required int lastBankSync,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(<GoalModel>[]) List<GoalModel> goals,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
