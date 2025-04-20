import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

@freezed
abstract class CreditModel with _$CreditModel {
  const factory CreditModel({
    required String category,
    required String title,
    required double costs,
    @DateTimeConverter() required DateTime date,
    String? notes,
  }) = _CreditModel;

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);
}

@freezed
abstract class DebitModel with _$DebitModel {
  const factory DebitModel({
    required String category,
    required String title,
    required double costs,
    @DateTimeConverter() required DateTime date,
    String? notes,
  }) = _DebitModel;

  factory DebitModel.fromJson(Map<String, dynamic> json) =>
      _$DebitModelFromJson(json);
}
