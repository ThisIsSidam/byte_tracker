// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => _GoalModel(
      isShortTermed: json['isShortTermed'] as bool,
      priority: (json['priority'] as num).toInt(),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      currentlySaved: (json['currentlySaved'] as num).toDouble(),
      createdAt: const DateTimeConverter()
          .fromJson((json['createdAt'] as num).toInt()),
      remaindAt: const DateTimeConverter()
          .fromJson((json['remaindAt'] as num).toInt()),
    );

Map<String, dynamic> _$GoalModelToJson(_GoalModel instance) =>
    <String, dynamic>{
      'isShortTermed': instance.isShortTermed,
      'priority': instance.priority,
      'title': instance.title,
      'amount': instance.amount,
      'currentlySaved': instance.currentlySaved,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'remaindAt': const DateTimeConverter().toJson(instance.remaindAt),
    };
