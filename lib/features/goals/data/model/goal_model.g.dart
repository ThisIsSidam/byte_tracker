// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => _GoalModel(
      isShortTerm: json['isShortTerm'] as bool,
      priority: (json['priority'] as num).toInt(),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      currentlySaved: (json['currentlySaved'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      reminderAt: DateTime.parse(json['reminderAt'] as String),
    );

Map<String, dynamic> _$GoalModelToJson(_GoalModel instance) =>
    <String, dynamic>{
      'isShortTerm': instance.isShortTerm,
      'priority': instance.priority,
      'title': instance.title,
      'amount': instance.amount,
      'currentlySaved': instance.currentlySaved,
      'createdAt': instance.createdAt.toIso8601String(),
      'reminderAt': instance.reminderAt.toIso8601String(),
    };
