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
  @JsonKey(name: 'id_')
  String get id;
  String get username;
  String get email;
  String get password;
  @JsonKey(name: 'gross_amount')
  double get grossAmount;
  double get alertOnRemaining;
  double get limitForDay;

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
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.alertOnRemaining, alertOnRemaining) ||
                other.alertOnRemaining == alertOnRemaining) &&
            (identical(other.limitForDay, limitForDay) ||
                other.limitForDay == limitForDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, password,
      grossAmount, alertOnRemaining, limitForDay);

  @override
  String toString() {
    return 'AppUser(id: $id, username: $username, email: $email, password: $password, grossAmount: $grossAmount, alertOnRemaining: $alertOnRemaining, limitForDay: $limitForDay)';
  }
}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) =
      _$AppUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_') String id,
      String username,
      String email,
      String password,
      @JsonKey(name: 'gross_amount') double grossAmount,
      double alertOnRemaining,
      double limitForDay});
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
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? grossAmount = null,
    Object? alertOnRemaining = null,
    Object? limitForDay = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      alertOnRemaining: null == alertOnRemaining
          ? _self.alertOnRemaining
          : alertOnRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      limitForDay: null == limitForDay
          ? _self.limitForDay
          : limitForDay // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppUser implements AppUser {
  const _AppUser(
      {@JsonKey(name: 'id_') required this.id,
      required this.username,
      required this.email,
      required this.password,
      @JsonKey(name: 'gross_amount') required this.grossAmount,
      required this.alertOnRemaining,
      required this.limitForDay});
  factory _AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  @override
  @JsonKey(name: 'id_')
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'gross_amount')
  final double grossAmount;
  @override
  final double alertOnRemaining;
  @override
  final double limitForDay;

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
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.alertOnRemaining, alertOnRemaining) ||
                other.alertOnRemaining == alertOnRemaining) &&
            (identical(other.limitForDay, limitForDay) ||
                other.limitForDay == limitForDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, password,
      grossAmount, alertOnRemaining, limitForDay);

  @override
  String toString() {
    return 'AppUser(id: $id, username: $username, email: $email, password: $password, grossAmount: $grossAmount, alertOnRemaining: $alertOnRemaining, limitForDay: $limitForDay)';
  }
}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) =
      __$AppUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_') String id,
      String username,
      String email,
      String password,
      @JsonKey(name: 'gross_amount') double grossAmount,
      double alertOnRemaining,
      double limitForDay});
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
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? grossAmount = null,
    Object? alertOnRemaining = null,
    Object? limitForDay = null,
  }) {
    return _then(_AppUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      alertOnRemaining: null == alertOnRemaining
          ? _self.alertOnRemaining
          : alertOnRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      limitForDay: null == limitForDay
          ? _self.limitForDay
          : limitForDay // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
