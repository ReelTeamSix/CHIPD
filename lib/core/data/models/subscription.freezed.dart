// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Subscription {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Subscription()';
}


}

/// @nodoc
class $SubscriptionCopyWith<$Res>  {
$SubscriptionCopyWith(Subscription _, $Res Function(Subscription) __);
}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscriptionStateData value)?  active,TResult Function( SubscriptionInactiveStateData value)?  inactive,TResult Function( SubscriptionStateLoading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscriptionStateData() when active != null:
return active(_that);case SubscriptionInactiveStateData() when inactive != null:
return inactive(_that);case SubscriptionStateLoading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscriptionStateData value)  active,required TResult Function( SubscriptionInactiveStateData value)  inactive,required TResult Function( SubscriptionStateLoading value)  loading,}){
final _that = this;
switch (_that) {
case SubscriptionStateData():
return active(_that);case SubscriptionInactiveStateData():
return inactive(_that);case SubscriptionStateLoading():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscriptionStateData value)?  active,TResult? Function( SubscriptionInactiveStateData value)?  inactive,TResult? Function( SubscriptionStateLoading value)?  loading,}){
final _that = this;
switch (_that) {
case SubscriptionStateData() when active != null:
return active(_that);case SubscriptionInactiveStateData() when inactive != null:
return inactive(_that);case SubscriptionStateLoading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SubscriptionProduct? activeOffer,  List<EntitlementInfo>? entitlements)?  active,TResult Function( int hoursBetweenTwoRequests,  DateTime? lastAskingDate)?  inactive,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscriptionStateData() when active != null:
return active(_that.activeOffer,_that.entitlements);case SubscriptionInactiveStateData() when inactive != null:
return inactive(_that.hoursBetweenTwoRequests,_that.lastAskingDate);case SubscriptionStateLoading() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SubscriptionProduct? activeOffer,  List<EntitlementInfo>? entitlements)  active,required TResult Function( int hoursBetweenTwoRequests,  DateTime? lastAskingDate)  inactive,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case SubscriptionStateData():
return active(_that.activeOffer,_that.entitlements);case SubscriptionInactiveStateData():
return inactive(_that.hoursBetweenTwoRequests,_that.lastAskingDate);case SubscriptionStateLoading():
return loading();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SubscriptionProduct? activeOffer,  List<EntitlementInfo>? entitlements)?  active,TResult? Function( int hoursBetweenTwoRequests,  DateTime? lastAskingDate)?  inactive,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case SubscriptionStateData() when active != null:
return active(_that.activeOffer,_that.entitlements);case SubscriptionInactiveStateData() when inactive != null:
return inactive(_that.hoursBetweenTwoRequests,_that.lastAskingDate);case SubscriptionStateLoading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class SubscriptionStateData extends Subscription {
  const SubscriptionStateData({this.activeOffer, final  List<EntitlementInfo>? entitlements}): _entitlements = entitlements,super._();
  

 final  SubscriptionProduct? activeOffer;
 final  List<EntitlementInfo>? _entitlements;
 List<EntitlementInfo>? get entitlements {
  final value = _entitlements;
  if (value == null) return null;
  if (_entitlements is EqualUnmodifiableListView) return _entitlements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionStateDataCopyWith<SubscriptionStateData> get copyWith => _$SubscriptionStateDataCopyWithImpl<SubscriptionStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionStateData&&(identical(other.activeOffer, activeOffer) || other.activeOffer == activeOffer)&&const DeepCollectionEquality().equals(other._entitlements, _entitlements));
}


@override
int get hashCode => Object.hash(runtimeType,activeOffer,const DeepCollectionEquality().hash(_entitlements));

@override
String toString() {
  return 'Subscription.active(activeOffer: $activeOffer, entitlements: $entitlements)';
}


}

/// @nodoc
abstract mixin class $SubscriptionStateDataCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory $SubscriptionStateDataCopyWith(SubscriptionStateData value, $Res Function(SubscriptionStateData) _then) = _$SubscriptionStateDataCopyWithImpl;
@useResult
$Res call({
 SubscriptionProduct? activeOffer, List<EntitlementInfo>? entitlements
});




}
/// @nodoc
class _$SubscriptionStateDataCopyWithImpl<$Res>
    implements $SubscriptionStateDataCopyWith<$Res> {
  _$SubscriptionStateDataCopyWithImpl(this._self, this._then);

  final SubscriptionStateData _self;
  final $Res Function(SubscriptionStateData) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activeOffer = freezed,Object? entitlements = freezed,}) {
  return _then(SubscriptionStateData(
activeOffer: freezed == activeOffer ? _self.activeOffer : activeOffer // ignore: cast_nullable_to_non_nullable
as SubscriptionProduct?,entitlements: freezed == entitlements ? _self._entitlements : entitlements // ignore: cast_nullable_to_non_nullable
as List<EntitlementInfo>?,
  ));
}


}

/// @nodoc


class SubscriptionInactiveStateData extends Subscription {
  const SubscriptionInactiveStateData({required this.hoursBetweenTwoRequests, this.lastAskingDate}): super._();
  

 final  int hoursBetweenTwoRequests;
 final  DateTime? lastAskingDate;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionInactiveStateDataCopyWith<SubscriptionInactiveStateData> get copyWith => _$SubscriptionInactiveStateDataCopyWithImpl<SubscriptionInactiveStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionInactiveStateData&&(identical(other.hoursBetweenTwoRequests, hoursBetweenTwoRequests) || other.hoursBetweenTwoRequests == hoursBetweenTwoRequests)&&(identical(other.lastAskingDate, lastAskingDate) || other.lastAskingDate == lastAskingDate));
}


@override
int get hashCode => Object.hash(runtimeType,hoursBetweenTwoRequests,lastAskingDate);

@override
String toString() {
  return 'Subscription.inactive(hoursBetweenTwoRequests: $hoursBetweenTwoRequests, lastAskingDate: $lastAskingDate)';
}


}

/// @nodoc
abstract mixin class $SubscriptionInactiveStateDataCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory $SubscriptionInactiveStateDataCopyWith(SubscriptionInactiveStateData value, $Res Function(SubscriptionInactiveStateData) _then) = _$SubscriptionInactiveStateDataCopyWithImpl;
@useResult
$Res call({
 int hoursBetweenTwoRequests, DateTime? lastAskingDate
});




}
/// @nodoc
class _$SubscriptionInactiveStateDataCopyWithImpl<$Res>
    implements $SubscriptionInactiveStateDataCopyWith<$Res> {
  _$SubscriptionInactiveStateDataCopyWithImpl(this._self, this._then);

  final SubscriptionInactiveStateData _self;
  final $Res Function(SubscriptionInactiveStateData) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hoursBetweenTwoRequests = null,Object? lastAskingDate = freezed,}) {
  return _then(SubscriptionInactiveStateData(
hoursBetweenTwoRequests: null == hoursBetweenTwoRequests ? _self.hoursBetweenTwoRequests : hoursBetweenTwoRequests // ignore: cast_nullable_to_non_nullable
as int,lastAskingDate: freezed == lastAskingDate ? _self.lastAskingDate : lastAskingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class SubscriptionStateLoading extends Subscription {
  const SubscriptionStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Subscription.loading()';
}


}




// dart format on
