// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
      id: json['id_'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      grossAmount: (json['gross_amount'] as num).toDouble(),
      alertOnRemaining: (json['alertOnRemaining'] as num).toDouble(),
      limitForDay: (json['limitForDay'] as num).toDouble(),
    );

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
      'id_': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'gross_amount': instance.grossAmount,
      'alertOnRemaining': instance.alertOnRemaining,
      'limitForDay': instance.limitForDay,
    };
