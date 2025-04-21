// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditModel {
  String get title;
  double get costs;
  @DateTimeConverter()
  DateTime get date;
  String get category;
  String? get notes;

  /// Create a copy of CreditModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreditModelCopyWith<CreditModel> get copyWith =>
      _$CreditModelCopyWithImpl<CreditModel>(this as CreditModel, _$identity);

  /// Serializes this CreditModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreditModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, costs, date, category, notes);

  @override
  String toString() {
    return 'CreditModel(title: $title, costs: $costs, date: $date, category: $category, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $CreditModelCopyWith<$Res> {
  factory $CreditModelCopyWith(
          CreditModel value, $Res Function(CreditModel) _then) =
      _$CreditModelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      double costs,
      @DateTimeConverter() DateTime date,
      String category,
      String? notes});
}

/// @nodoc
class _$CreditModelCopyWithImpl<$Res> implements $CreditModelCopyWith<$Res> {
  _$CreditModelCopyWithImpl(this._self, this._then);

  final CreditModel _self;
  final $Res Function(CreditModel) _then;

  /// Create a copy of CreditModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? costs = null,
    Object? date = null,
    Object? category = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _self.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreditModel implements CreditModel {
  const _CreditModel(
      {required this.title,
      required this.costs,
      @DateTimeConverter() required this.date,
      this.category = '',
      this.notes});
  factory _CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);

  @override
  final String title;
  @override
  final double costs;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  @JsonKey()
  final String category;
  @override
  final String? notes;

  /// Create a copy of CreditModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreditModelCopyWith<_CreditModel> get copyWith =>
      __$CreditModelCopyWithImpl<_CreditModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreditModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, costs, date, category, notes);

  @override
  String toString() {
    return 'CreditModel(title: $title, costs: $costs, date: $date, category: $category, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$CreditModelCopyWith<$Res>
    implements $CreditModelCopyWith<$Res> {
  factory _$CreditModelCopyWith(
          _CreditModel value, $Res Function(_CreditModel) _then) =
      __$CreditModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      double costs,
      @DateTimeConverter() DateTime date,
      String category,
      String? notes});
}

/// @nodoc
class __$CreditModelCopyWithImpl<$Res> implements _$CreditModelCopyWith<$Res> {
  __$CreditModelCopyWithImpl(this._self, this._then);

  final _CreditModel _self;
  final $Res Function(_CreditModel) _then;

  /// Create a copy of CreditModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? costs = null,
    Object? date = null,
    Object? category = null,
    Object? notes = freezed,
  }) {
    return _then(_CreditModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _self.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$DebitModel {
  String get category;
  String get title;
  double get costs;
  @DateTimeConverter()
  DateTime get date;
  String? get notes;

  /// Create a copy of DebitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DebitModelCopyWith<DebitModel> get copyWith =>
      _$DebitModelCopyWithImpl<DebitModel>(this as DebitModel, _$identity);

  /// Serializes this DebitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DebitModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, title, costs, date, notes);

  @override
  String toString() {
    return 'DebitModel(category: $category, title: $title, costs: $costs, date: $date, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $DebitModelCopyWith<$Res> {
  factory $DebitModelCopyWith(
          DebitModel value, $Res Function(DebitModel) _then) =
      _$DebitModelCopyWithImpl;
  @useResult
  $Res call(
      {String category,
      String title,
      double costs,
      @DateTimeConverter() DateTime date,
      String? notes});
}

/// @nodoc
class _$DebitModelCopyWithImpl<$Res> implements $DebitModelCopyWith<$Res> {
  _$DebitModelCopyWithImpl(this._self, this._then);

  final DebitModel _self;
  final $Res Function(DebitModel) _then;

  /// Create a copy of DebitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? title = null,
    Object? costs = null,
    Object? date = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _self.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DebitModel implements DebitModel {
  const _DebitModel(
      {required this.category,
      required this.title,
      required this.costs,
      @DateTimeConverter() required this.date,
      this.notes});
  factory _DebitModel.fromJson(Map<String, dynamic> json) =>
      _$DebitModelFromJson(json);

  @override
  final String category;
  @override
  final String title;
  @override
  final double costs;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  final String? notes;

  /// Create a copy of DebitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DebitModelCopyWith<_DebitModel> get copyWith =>
      __$DebitModelCopyWithImpl<_DebitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DebitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DebitModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, title, costs, date, notes);

  @override
  String toString() {
    return 'DebitModel(category: $category, title: $title, costs: $costs, date: $date, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$DebitModelCopyWith<$Res>
    implements $DebitModelCopyWith<$Res> {
  factory _$DebitModelCopyWith(
          _DebitModel value, $Res Function(_DebitModel) _then) =
      __$DebitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String category,
      String title,
      double costs,
      @DateTimeConverter() DateTime date,
      String? notes});
}

/// @nodoc
class __$DebitModelCopyWithImpl<$Res> implements _$DebitModelCopyWith<$Res> {
  __$DebitModelCopyWithImpl(this._self, this._then);

  final _DebitModel _self;
  final $Res Function(_DebitModel) _then;

  /// Create a copy of DebitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
    Object? title = null,
    Object? costs = null,
    Object? date = null,
    Object? notes = freezed,
  }) {
    return _then(_DebitModel(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _self.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CategoryModel {
  String get name;
  bool get isArchived;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      _$CategoryModelCopyWithImpl<CategoryModel>(
          this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, isArchived);

  @override
  String toString() {
    return 'CategoryModel(name: $name, isArchived: $isArchived)';
  }
}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) _then) =
      _$CategoryModelCopyWithImpl;
  @useResult
  $Res call({String name, bool isArchived});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isArchived = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryModel implements CategoryModel {
  const _CategoryModel({required this.name, required this.isArchived});
  factory _CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  final String name;
  @override
  final bool isArchived;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, isArchived);

  @override
  String toString() {
    return 'CategoryModel(name: $name, isArchived: $isArchived)';
  }
}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) _then) =
      __$CategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, bool isArchived});
}

/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? isArchived = null,
  }) {
    return _then(_CategoryModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
