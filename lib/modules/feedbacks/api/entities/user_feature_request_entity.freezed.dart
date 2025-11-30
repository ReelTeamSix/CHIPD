// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_feature_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserFeatureRequestEntity _$UserFeatureRequestEntityFromJson(
  Map<String, dynamic> json
) {
    return UserFeatureRequestEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserFeatureRequestEntity {

@JsonKey() String? get id;@JsonKey(name: 'creation_date') DateTime get creationDate; String get title; String get description;@JsonKey(name: 'user_uid') String get userId;
/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureRequestEntityCopyWith<UserFeatureRequestEntity> get copyWith => _$UserFeatureRequestEntityCopyWithImpl<UserFeatureRequestEntity>(this as UserFeatureRequestEntity, _$identity);

  /// Serializes this UserFeatureRequestEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,userId);

@override
String toString() {
  return 'UserFeatureRequestEntity(id: $id, creationDate: $creationDate, title: $title, description: $description, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureRequestEntityCopyWith<$Res>  {
  factory $UserFeatureRequestEntityCopyWith(UserFeatureRequestEntity value, $Res Function(UserFeatureRequestEntity) _then) = _$UserFeatureRequestEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey() String? id,@JsonKey(name: 'creation_date') DateTime creationDate, String title, String description,@JsonKey(name: 'user_uid') String userId
});




}
/// @nodoc
class _$UserFeatureRequestEntityCopyWithImpl<$Res>
    implements $UserFeatureRequestEntityCopyWith<$Res> {
  _$UserFeatureRequestEntityCopyWithImpl(this._self, this._then);

  final UserFeatureRequestEntity _self;
  final $Res Function(UserFeatureRequestEntity) _then;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? title = null,Object? description = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFeatureRequestEntity].
extension UserFeatureRequestEntityPatterns on UserFeatureRequestEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( UserFeatureRequestEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserFeatureRequestEntityData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( UserFeatureRequestEntityData value)  $default,){
final _that = this;
switch (_that) {
case UserFeatureRequestEntityData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( UserFeatureRequestEntityData value)?  $default,){
final _that = this;
switch (_that) {
case UserFeatureRequestEntityData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey()  String? id, @JsonKey(name: 'creation_date')  DateTime creationDate,  String title,  String description, @JsonKey(name: 'user_uid')  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserFeatureRequestEntityData() when $default != null:
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.userId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey()  String? id, @JsonKey(name: 'creation_date')  DateTime creationDate,  String title,  String description, @JsonKey(name: 'user_uid')  String userId)  $default,) {final _that = this;
switch (_that) {
case UserFeatureRequestEntityData():
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.userId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey()  String? id, @JsonKey(name: 'creation_date')  DateTime creationDate,  String title,  String description, @JsonKey(name: 'user_uid')  String userId)?  $default,) {final _that = this;
switch (_that) {
case UserFeatureRequestEntityData() when $default != null:
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UserFeatureRequestEntityData extends UserFeatureRequestEntity {
  const UserFeatureRequestEntityData({@JsonKey() this.id, @JsonKey(name: 'creation_date') required this.creationDate, required this.title, required this.description, @JsonKey(name: 'user_uid') required this.userId}): super._();
  factory UserFeatureRequestEntityData.fromJson(Map<String, dynamic> json) => _$UserFeatureRequestEntityDataFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey(name: 'creation_date') final  DateTime creationDate;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'user_uid') final  String userId;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureRequestEntityDataCopyWith<UserFeatureRequestEntityData> get copyWith => _$UserFeatureRequestEntityDataCopyWithImpl<UserFeatureRequestEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFeatureRequestEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureRequestEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,userId);

@override
String toString() {
  return 'UserFeatureRequestEntity(id: $id, creationDate: $creationDate, title: $title, description: $description, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureRequestEntityDataCopyWith<$Res> implements $UserFeatureRequestEntityCopyWith<$Res> {
  factory $UserFeatureRequestEntityDataCopyWith(UserFeatureRequestEntityData value, $Res Function(UserFeatureRequestEntityData) _then) = _$UserFeatureRequestEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey() String? id,@JsonKey(name: 'creation_date') DateTime creationDate, String title, String description,@JsonKey(name: 'user_uid') String userId
});




}
/// @nodoc
class _$UserFeatureRequestEntityDataCopyWithImpl<$Res>
    implements $UserFeatureRequestEntityDataCopyWith<$Res> {
  _$UserFeatureRequestEntityDataCopyWithImpl(this._self, this._then);

  final UserFeatureRequestEntityData _self;
  final $Res Function(UserFeatureRequestEntityData) _then;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? title = null,Object? description = null,Object? userId = null,}) {
  return _then(UserFeatureRequestEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
