import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

abstract class ITransactionModel {
  String get transactionId;
  DateTime get date;
  String get title;
  String? get notes;
  String get category;
  double get costs;
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

@freezed
abstract class CreditModel with _$CreditModel implements ITransactionModel {
  const factory CreditModel({
    @JsonKey(name: '_id') required String transactionId,
    required String title,
    required double costs,
    @DateTimeConverter() required DateTime date,
    @Default('') String category,
    String? notes,
  }) = _CreditModel;

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);
}

@freezed
abstract class DebitModel with _$DebitModel implements ITransactionModel {
  const factory DebitModel({
    @JsonKey(name: '_id') required String transactionId,
    required String category,
    required String title,
    required double costs,
    @DateTimeConverter() required DateTime date,
    String? notes,
  }) = _DebitModel;

  factory DebitModel.fromJson(Map<String, dynamic> json) =>
      _$DebitModelFromJson(json);
}

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String name,
    required bool isArchived,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
