// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {
  @JsonKey(name: '_id')
  String get id;
  String get firstName;
  String get lastName;
  String get aadharId;
  String get email;
  @JsonKey(name: 'grossAmount')
  int get grossAmount;
  @JsonKey(name: 'alertOnRemaigning')
  int get alertOnRemaigning;
  @JsonKey(name: 'limitForDay')
  int get limitForDay;
  @JsonKey(name: 'lastBankSync')
  int get lastBankSync;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<AppUser> get copyWith =>
      _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.aadharId, aadharId) ||
                other.aadharId == aadharId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.alertOnRemaigning, alertOnRemaigning) ||
                other.alertOnRemaigning == alertOnRemaigning) &&
            (identical(other.limitForDay, limitForDay) ||
                other.limitForDay == limitForDay) &&
            (identical(other.lastBankSync, lastBankSync) ||
                other.lastBankSync == lastBankSync) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      aadharId,
      email,
      grossAmount,
      alertOnRemaigning,
      limitForDay,
      lastBankSync,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'AppUser(id: $id, firstName: $firstName, lastName: $lastName, aadharId: $aadharId, email: $email, grossAmount: $grossAmount, alertOnRemaigning: $alertOnRemaigning, limitForDay: $limitForDay, lastBankSync: $lastBankSync, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) =
      _$AppUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String firstName,
      String lastName,
      String aadharId,
      String email,
      @JsonKey(name: 'grossAmount') int grossAmount,
      @JsonKey(name: 'alertOnRemaigning') int alertOnRemaigning,
      @JsonKey(name: 'limitForDay') int limitForDay,
      @JsonKey(name: 'lastBankSync') int lastBankSync,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? aadharId = null,
    Object? email = null,
    Object? grossAmount = null,
    Object? alertOnRemaigning = null,
    Object? limitForDay = null,
    Object? lastBankSync = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      aadharId: null == aadharId
          ? _self.aadharId
          : aadharId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
      alertOnRemaigning: null == alertOnRemaigning
          ? _self.alertOnRemaigning
          : alertOnRemaigning // ignore: cast_nullable_to_non_nullable
              as int,
      limitForDay: null == limitForDay
          ? _self.limitForDay
          : limitForDay // ignore: cast_nullable_to_non_nullable
              as int,
      lastBankSync: null == lastBankSync
          ? _self.lastBankSync
          : lastBankSync // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppUser implements AppUser {
  const _AppUser(
      {@JsonKey(name: '_id') required this.id,
      required this.firstName,
      required this.lastName,
      required this.aadharId,
      required this.email,
      @JsonKey(name: 'grossAmount') required this.grossAmount,
      @JsonKey(name: 'alertOnRemaigning') required this.alertOnRemaigning,
      @JsonKey(name: 'limitForDay') required this.limitForDay,
      @JsonKey(name: 'lastBankSync') required this.lastBankSync,
      required this.createdAt,
      required this.updatedAt});
  factory _AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String aadharId;
  @override
  final String email;
  @override
  @JsonKey(name: 'grossAmount')
  final int grossAmount;
  @override
  @JsonKey(name: 'alertOnRemaigning')
  final int alertOnRemaigning;
  @override
  @JsonKey(name: 'limitForDay')
  final int limitForDay;
  @override
  @JsonKey(name: 'lastBankSync')
  final int lastBankSync;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.aadharId, aadharId) ||
                other.aadharId == aadharId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.alertOnRemaigning, alertOnRemaigning) ||
                other.alertOnRemaigning == alertOnRemaigning) &&
            (identical(other.limitForDay, limitForDay) ||
                other.limitForDay == limitForDay) &&
            (identical(other.lastBankSync, lastBankSync) ||
                other.lastBankSync == lastBankSync) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      aadharId,
      email,
      grossAmount,
      alertOnRemaigning,
      limitForDay,
      lastBankSync,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'AppUser(id: $id, firstName: $firstName, lastName: $lastName, aadharId: $aadharId, email: $email, grossAmount: $grossAmount, alertOnRemaigning: $alertOnRemaigning, limitForDay: $limitForDay, lastBankSync: $lastBankSync, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) =
      __$AppUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String firstName,
      String lastName,
      String aadharId,
      String email,
      @JsonKey(name: 'grossAmount') int grossAmount,
      @JsonKey(name: 'alertOnRemaigning') int alertOnRemaigning,
      @JsonKey(name: 'limitForDay') int limitForDay,
      @JsonKey(name: 'lastBankSync') int lastBankSync,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? aadharId = null,
    Object? email = null,
    Object? grossAmount = null,
    Object? alertOnRemaigning = null,
    Object? limitForDay = null,
    Object? lastBankSync = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_AppUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      aadharId: null == aadharId
          ? _self.aadharId
          : aadharId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
      alertOnRemaigning: null == alertOnRemaigning
          ? _self.alertOnRemaigning
          : alertOnRemaigning // ignore: cast_nullable_to_non_nullable
              as int,
      limitForDay: null == limitForDay
          ? _self.limitForDay
          : limitForDay // ignore: cast_nullable_to_non_nullable
              as int,
      lastBankSync: null == lastBankSync
          ? _self.lastBankSync
          : lastBankSync // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
