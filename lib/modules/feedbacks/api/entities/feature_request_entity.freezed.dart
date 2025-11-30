// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FeatureRequestEntity _$FeatureRequestEntityFromJson(
  Map<String, dynamic> json
) {
    return FeatureRequestEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$FeatureRequestEntity {

@JsonKey() String? get id;@JsonKey(name: "creation_date") DateTime get creationDate;@JsonKey(name: "last_update_date") DateTime get lastUpdateDate; Map<String, String> get title; Map<String, String> get description; int get votes; bool get active;
/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestEntityCopyWith<FeatureRequestEntity> get copyWith => _$FeatureRequestEntityCopyWithImpl<FeatureRequestEntity>(this as FeatureRequestEntity, _$identity);

  /// Serializes this FeatureRequestEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(description),votes,active);

@override
String toString() {
  return 'FeatureRequestEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, title: $title, description: $description, votes: $votes, active: $active)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestEntityCopyWith<$Res>  {
  factory $FeatureRequestEntityCopyWith(FeatureRequestEntity value, $Res Function(FeatureRequestEntity) _then) = _$FeatureRequestEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey() String? id,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "last_update_date") DateTime lastUpdateDate, Map<String, String> title, Map<String, String> description, int votes, bool active
});




}
/// @nodoc
class _$FeatureRequestEntityCopyWithImpl<$Res>
    implements $FeatureRequestEntityCopyWith<$Res> {
  _$FeatureRequestEntityCopyWithImpl(this._self, this._then);

  final FeatureRequestEntity _self;
  final $Res Function(FeatureRequestEntity) _then;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? title = null,Object? description = null,Object? votes = null,Object? active = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureRequestEntity].
extension FeatureRequestEntityPatterns on FeatureRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( FeatureRequestEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeatureRequestEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( FeatureRequestEntityData value)  $default,){
final _that = this;
switch (_that) {
case FeatureRequestEntityData():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( FeatureRequestEntityData value)?  $default,){
final _that = this;
switch (_that) {
case FeatureRequestEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey()  String? id, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "last_update_date")  DateTime lastUpdateDate,  Map<String, String> title,  Map<String, String> description,  int votes,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeatureRequestEntityData() when $default != null:
return $default(_that.id,_that.creationDate,_that.lastUpdateDate,_that.title,_that.description,_that.votes,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey()  String? id, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "last_update_date")  DateTime lastUpdateDate,  Map<String, String> title,  Map<String, String> description,  int votes,  bool active)  $default,) {final _that = this;
switch (_that) {
case FeatureRequestEntityData():
return $default(_that.id,_that.creationDate,_that.lastUpdateDate,_that.title,_that.description,_that.votes,_that.active);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey()  String? id, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "last_update_date")  DateTime lastUpdateDate,  Map<String, String> title,  Map<String, String> description,  int votes,  bool active)?  $default,) {final _that = this;
switch (_that) {
case FeatureRequestEntityData() when $default != null:
return $default(_that.id,_that.creationDate,_that.lastUpdateDate,_that.title,_that.description,_that.votes,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FeatureRequestEntityData extends FeatureRequestEntity {
  const FeatureRequestEntityData({@JsonKey() this.id, @JsonKey(name: "creation_date") required this.creationDate, @JsonKey(name: "last_update_date") required this.lastUpdateDate, required final  Map<String, String> title, required final  Map<String, String> description, required this.votes, required this.active}): _title = title,_description = description,super._();
  factory FeatureRequestEntityData.fromJson(Map<String, dynamic> json) => _$FeatureRequestEntityDataFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey(name: "creation_date") final  DateTime creationDate;
@override@JsonKey(name: "last_update_date") final  DateTime lastUpdateDate;
 final  Map<String, String> _title;
@override Map<String, String> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  Map<String, String> _description;
@override Map<String, String> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  int votes;
@override final  bool active;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestEntityDataCopyWith<FeatureRequestEntityData> get copyWith => _$FeatureRequestEntityDataCopyWithImpl<FeatureRequestEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureRequestEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_description),votes,active);

@override
String toString() {
  return 'FeatureRequestEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, title: $title, description: $description, votes: $votes, active: $active)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestEntityDataCopyWith<$Res> implements $FeatureRequestEntityCopyWith<$Res> {
  factory $FeatureRequestEntityDataCopyWith(FeatureRequestEntityData value, $Res Function(FeatureRequestEntityData) _then) = _$FeatureRequestEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey() String? id,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "last_update_date") DateTime lastUpdateDate, Map<String, String> title, Map<String, String> description, int votes, bool active
});




}
/// @nodoc
class _$FeatureRequestEntityDataCopyWithImpl<$Res>
    implements $FeatureRequestEntityDataCopyWith<$Res> {
  _$FeatureRequestEntityDataCopyWithImpl(this._self, this._then);

  final FeatureRequestEntityData _self;
  final $Res Function(FeatureRequestEntityData) _then;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? title = null,Object? description = null,Object? votes = null,Object? active = null,}) {
  return _then(FeatureRequestEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
