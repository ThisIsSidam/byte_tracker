// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditModel _$CreditModelFromJson(Map<String, dynamic> json) => _CreditModel(
      title: json['title'] as String,
      costs: (json['costs'] as num).toDouble(),
      date: const DateTimeConverter().fromJson((json['date'] as num).toInt()),
      category: json['category'] as String? ?? '',
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreditModelToJson(_CreditModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'costs': instance.costs,
      'date': const DateTimeConverter().toJson(instance.date),
      'category': instance.category,
      'notes': instance.notes,
    };

_DebitModel _$DebitModelFromJson(Map<String, dynamic> json) => _DebitModel(
      category: json['category'] as String,
      title: json['title'] as String,
      costs: (json['costs'] as num).toDouble(),
      date: const DateTimeConverter().fromJson((json['date'] as num).toInt()),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$DebitModelToJson(_DebitModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'costs': instance.costs,
      'date': const DateTimeConverter().toJson(instance.date),
      'notes': instance.notes,
    };
