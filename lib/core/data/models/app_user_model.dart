import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(name: 'id_') required String id,
    required String username,
    required String email,
    required String password,
    @JsonKey(name: 'gross_amount') required double grossAmount,
    required double alertOnRemaining,
    required double limitForDay,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
