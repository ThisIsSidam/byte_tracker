// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      aadharId: json['aadharId'] as String,
      email: json['email'] as String,
      grossAmount: (json['grossAmount'] as num).toInt(),
      alertOnRemaigning: (json['alertOnRemaigning'] as num).toInt(),
      limitForDay: (json['limitForDay'] as num).toInt(),
      lastBankSync: (json['lastBankSync'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      goals: (json['goals'] as List<dynamic>?)
              ?.map((e) => GoalModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GoalModel>[],
    );

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'aadharId': instance.aadharId,
      'email': instance.email,
      'grossAmount': instance.grossAmount,
      'alertOnRemaigning': instance.alertOnRemaigning,
      'limitForDay': instance.limitForDay,
      'lastBankSync': instance.lastBankSync,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'goals': instance.goals,
    };
