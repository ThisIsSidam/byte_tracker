// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalModel {
  bool get isShortTerm;
  int get priority;
  String get title;
  double get amount;
  double get currentlySaved;
  DateTime get createdAt;
  DateTime get remainderAt;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoalModelCopyWith<GoalModel> get copyWith =>
      _$GoalModelCopyWithImpl<GoalModel>(this as GoalModel, _$identity);

  /// Serializes this GoalModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoalModel &&
            (identical(other.isShortTerm, isShortTerm) ||
                other.isShortTerm == isShortTerm) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currentlySaved, currentlySaved) ||
                other.currentlySaved == currentlySaved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.remainderAt, remainderAt) ||
                other.remainderAt == remainderAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isShortTerm, priority, title,
      amount, currentlySaved, createdAt, remainderAt);

  @override
  String toString() {
    return 'GoalModel(isShortTerm: $isShortTerm, priority: $priority, title: $title, amount: $amount, currentlySaved: $currentlySaved, createdAt: $createdAt, remainderAt: $remainderAt)';
  }
}

/// @nodoc
abstract mixin class $GoalModelCopyWith<$Res> {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) _then) =
      _$GoalModelCopyWithImpl;
  @useResult
  $Res call(
      {bool isShortTerm,
      int priority,
      String title,
      double amount,
      double currentlySaved,
      DateTime createdAt,
      DateTime remainderAt});
}

/// @nodoc
class _$GoalModelCopyWithImpl<$Res> implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._self, this._then);

  final GoalModel _self;
  final $Res Function(GoalModel) _then;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShortTerm = null,
    Object? priority = null,
    Object? title = null,
    Object? amount = null,
    Object? currentlySaved = null,
    Object? createdAt = null,
    Object? remainderAt = null,
  }) {
    return _then(_self.copyWith(
      isShortTerm: null == isShortTerm
          ? _self.isShortTerm
          : isShortTerm // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currentlySaved: null == currentlySaved
          ? _self.currentlySaved
          : currentlySaved // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainderAt: null == remainderAt
          ? _self.remainderAt
          : remainderAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GoalModel implements GoalModel {
  const _GoalModel(
      {required this.isShortTerm,
      required this.priority,
      required this.title,
      required this.amount,
      required this.currentlySaved,
      required this.createdAt,
      required this.remainderAt});
  factory _GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  @override
  final bool isShortTerm;
  @override
  final int priority;
  @override
  final String title;
  @override
  final double amount;
  @override
  final double currentlySaved;
  @override
  final DateTime createdAt;
  @override
  final DateTime remainderAt;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GoalModelCopyWith<_GoalModel> get copyWith =>
      __$GoalModelCopyWithImpl<_GoalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GoalModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoalModel &&
            (identical(other.isShortTerm, isShortTerm) ||
                other.isShortTerm == isShortTerm) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currentlySaved, currentlySaved) ||
                other.currentlySaved == currentlySaved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.remainderAt, remainderAt) ||
                other.remainderAt == remainderAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isShortTerm, priority, title,
      amount, currentlySaved, createdAt, remainderAt);

  @override
  String toString() {
    return 'GoalModel(isShortTerm: $isShortTerm, priority: $priority, title: $title, amount: $amount, currentlySaved: $currentlySaved, createdAt: $createdAt, remainderAt: $remainderAt)';
  }
}

/// @nodoc
abstract mixin class _$GoalModelCopyWith<$Res>
    implements $GoalModelCopyWith<$Res> {
  factory _$GoalModelCopyWith(
          _GoalModel value, $Res Function(_GoalModel) _then) =
      __$GoalModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isShortTerm,
      int priority,
      String title,
      double amount,
      double currentlySaved,
      DateTime createdAt,
      DateTime remainderAt});
}

/// @nodoc
class __$GoalModelCopyWithImpl<$Res> implements _$GoalModelCopyWith<$Res> {
  __$GoalModelCopyWithImpl(this._self, this._then);

  final _GoalModel _self;
  final $Res Function(_GoalModel) _then;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isShortTerm = null,
    Object? priority = null,
    Object? title = null,
    Object? amount = null,
    Object? currentlySaved = null,
    Object? createdAt = null,
    Object? remainderAt = null,
  }) {
    return _then(_GoalModel(
      isShortTerm: null == isShortTerm
          ? _self.isShortTerm
          : isShortTerm // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currentlySaved: null == currentlySaved
          ? _self.currentlySaved
          : currentlySaved // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainderAt: null == remainderAt
          ? _self.remainderAt
          : remainderAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
