// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SubscriptionEntity _$SubscriptionEntityFromJson(
  Map<String, dynamic> json
) {
    return SubscriptionEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$SubscriptionEntity {

@JsonKey(includeIfNull: false) String? get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'offer_id') String get offerId;@JsonKey(name: 'sku_id') String get skuId;@JsonKey(name: 'creation_date') DateTime? get creationDate;@JsonKey(name: 'last_update_date') DateTime? get lastUpdateDate;@JsonKey(name: 'period_end_date') DateTime? get periodEndDate;@JsonKey(name: 'status') SubscriptionStatus get status;
/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith => _$SubscriptionEntityCopyWithImpl<SubscriptionEntity>(this as SubscriptionEntity, _$identity);

  /// Serializes this SubscriptionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.periodEndDate, periodEndDate) || other.periodEndDate == periodEndDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,offerId,skuId,creationDate,lastUpdateDate,periodEndDate,status);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, userId: $userId, offerId: $offerId, skuId: $skuId, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, periodEndDate: $periodEndDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityCopyWith<$Res>  {
  factory $SubscriptionEntityCopyWith(SubscriptionEntity value, $Res Function(SubscriptionEntity) _then) = _$SubscriptionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'offer_id') String offerId,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,@JsonKey(name: 'period_end_date') DateTime? periodEndDate,@JsonKey(name: 'status') SubscriptionStatus status
});




}
/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final SubscriptionEntity _self;
  final $Res Function(SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? offerId = null,Object? skuId = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? periodEndDate = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionEntity].
extension SubscriptionEntityPatterns on SubscriptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( SubscriptionEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscriptionEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( SubscriptionEntityData value)  $default,){
final _that = this;
switch (_that) {
case SubscriptionEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( SubscriptionEntityData value)?  $default,){
final _that = this;
switch (_that) {
case SubscriptionEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'offer_id')  String offerId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'creation_date')  DateTime? creationDate, @JsonKey(name: 'last_update_date')  DateTime? lastUpdateDate, @JsonKey(name: 'period_end_date')  DateTime? periodEndDate, @JsonKey(name: 'status')  SubscriptionStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscriptionEntityData() when $default != null:
return $default(_that.id,_that.userId,_that.offerId,_that.skuId,_that.creationDate,_that.lastUpdateDate,_that.periodEndDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'offer_id')  String offerId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'creation_date')  DateTime? creationDate, @JsonKey(name: 'last_update_date')  DateTime? lastUpdateDate, @JsonKey(name: 'period_end_date')  DateTime? periodEndDate, @JsonKey(name: 'status')  SubscriptionStatus status)  $default,) {final _that = this;
switch (_that) {
case SubscriptionEntityData():
return $default(_that.id,_that.userId,_that.offerId,_that.skuId,_that.creationDate,_that.lastUpdateDate,_that.periodEndDate,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'offer_id')  String offerId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'creation_date')  DateTime? creationDate, @JsonKey(name: 'last_update_date')  DateTime? lastUpdateDate, @JsonKey(name: 'period_end_date')  DateTime? periodEndDate, @JsonKey(name: 'status')  SubscriptionStatus status)?  $default,) {final _that = this;
switch (_that) {
case SubscriptionEntityData() when $default != null:
return $default(_that.id,_that.userId,_that.offerId,_that.skuId,_that.creationDate,_that.lastUpdateDate,_that.periodEndDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SubscriptionEntityData implements SubscriptionEntity {
  const SubscriptionEntityData({@JsonKey(includeIfNull: false) this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'offer_id') required this.offerId, @JsonKey(name: 'sku_id') required this.skuId, @JsonKey(name: 'creation_date') this.creationDate, @JsonKey(name: 'last_update_date') this.lastUpdateDate, @JsonKey(name: 'period_end_date') this.periodEndDate, @JsonKey(name: 'status') required this.status});
  factory SubscriptionEntityData.fromJson(Map<String, dynamic> json) => _$SubscriptionEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'offer_id') final  String offerId;
@override@JsonKey(name: 'sku_id') final  String skuId;
@override@JsonKey(name: 'creation_date') final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date') final  DateTime? lastUpdateDate;
@override@JsonKey(name: 'period_end_date') final  DateTime? periodEndDate;
@override@JsonKey(name: 'status') final  SubscriptionStatus status;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityDataCopyWith<SubscriptionEntityData> get copyWith => _$SubscriptionEntityDataCopyWithImpl<SubscriptionEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.periodEndDate, periodEndDate) || other.periodEndDate == periodEndDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,offerId,skuId,creationDate,lastUpdateDate,periodEndDate,status);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, userId: $userId, offerId: $offerId, skuId: $skuId, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, periodEndDate: $periodEndDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityDataCopyWith<$Res> implements $SubscriptionEntityCopyWith<$Res> {
  factory $SubscriptionEntityDataCopyWith(SubscriptionEntityData value, $Res Function(SubscriptionEntityData) _then) = _$SubscriptionEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'offer_id') String offerId,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,@JsonKey(name: 'period_end_date') DateTime? periodEndDate,@JsonKey(name: 'status') SubscriptionStatus status
});




}
/// @nodoc
class _$SubscriptionEntityDataCopyWithImpl<$Res>
    implements $SubscriptionEntityDataCopyWith<$Res> {
  _$SubscriptionEntityDataCopyWithImpl(this._self, this._then);

  final SubscriptionEntityData _self;
  final $Res Function(SubscriptionEntityData) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? offerId = null,Object? skuId = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? periodEndDate = freezed,Object? status = null,}) {
  return _then(SubscriptionEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,
  ));
}


}

// dart format on
