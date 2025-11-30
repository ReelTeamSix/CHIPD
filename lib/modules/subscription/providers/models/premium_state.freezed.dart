// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PremiumState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremiumState()';
}


}

/// @nodoc
class $PremiumStateCopyWith<$Res>  {
$PremiumStateCopyWith(PremiumState _, $Res Function(PremiumState) __);
}


/// Adds pattern-matching-related methods to [PremiumState].
extension PremiumStatePatterns on PremiumState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( PremiumStateData value)?  $default,{TResult Function( PremiumStateActive value)?  active,TResult Function( PremiumStateSending value)?  sending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PremiumStateData() when $default != null:
return $default(_that);case PremiumStateActive() when active != null:
return active(_that);case PremiumStateSending() when sending != null:
return sending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( PremiumStateData value)  $default,{required TResult Function( PremiumStateActive value)  active,required TResult Function( PremiumStateSending value)  sending,}){
final _that = this;
switch (_that) {
case PremiumStateData():
return $default(_that);case PremiumStateActive():
return active(_that);case PremiumStateSending():
return sending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( PremiumStateData value)?  $default,{TResult? Function( PremiumStateActive value)?  active,TResult? Function( PremiumStateSending value)?  sending,}){
final _that = this;
switch (_that) {
case PremiumStateData() when $default != null:
return $default(_that);case PremiumStateActive() when active != null:
return active(_that);case PremiumStateSending() when sending != null:
return sending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubscriptionProduct> offers,  SubscriptionProduct? selectedOffer)?  $default,{TResult Function( SubscriptionProduct? activeOffer)?  active,TResult Function( List<SubscriptionProduct> offers,  bool isPremium,  SubscriptionProduct? selectedOffer)?  sending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PremiumStateData() when $default != null:
return $default(_that.offers,_that.selectedOffer);case PremiumStateActive() when active != null:
return active(_that.activeOffer);case PremiumStateSending() when sending != null:
return sending(_that.offers,_that.isPremium,_that.selectedOffer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubscriptionProduct> offers,  SubscriptionProduct? selectedOffer)  $default,{required TResult Function( SubscriptionProduct? activeOffer)  active,required TResult Function( List<SubscriptionProduct> offers,  bool isPremium,  SubscriptionProduct? selectedOffer)  sending,}) {final _that = this;
switch (_that) {
case PremiumStateData():
return $default(_that.offers,_that.selectedOffer);case PremiumStateActive():
return active(_that.activeOffer);case PremiumStateSending():
return sending(_that.offers,_that.isPremium,_that.selectedOffer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubscriptionProduct> offers,  SubscriptionProduct? selectedOffer)?  $default,{TResult? Function( SubscriptionProduct? activeOffer)?  active,TResult? Function( List<SubscriptionProduct> offers,  bool isPremium,  SubscriptionProduct? selectedOffer)?  sending,}) {final _that = this;
switch (_that) {
case PremiumStateData() when $default != null:
return $default(_that.offers,_that.selectedOffer);case PremiumStateActive() when active != null:
return active(_that.activeOffer);case PremiumStateSending() when sending != null:
return sending(_that.offers,_that.isPremium,_that.selectedOffer);case _:
  return null;

}
}

}

/// @nodoc


class PremiumStateData extends PremiumState {
  const PremiumStateData({required final  List<SubscriptionProduct> offers, this.selectedOffer}): _offers = offers,super._();
  

 final  List<SubscriptionProduct> _offers;
 List<SubscriptionProduct> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  SubscriptionProduct? selectedOffer;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateDataCopyWith<PremiumStateData> get copyWith => _$PremiumStateDataCopyWithImpl<PremiumStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateData&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.selectedOffer, selectedOffer) || other.selectedOffer == selectedOffer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),selectedOffer);

@override
String toString() {
  return 'PremiumState(offers: $offers, selectedOffer: $selectedOffer)';
}


}

/// @nodoc
abstract mixin class $PremiumStateDataCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStateDataCopyWith(PremiumStateData value, $Res Function(PremiumStateData) _then) = _$PremiumStateDataCopyWithImpl;
@useResult
$Res call({
 List<SubscriptionProduct> offers, SubscriptionProduct? selectedOffer
});




}
/// @nodoc
class _$PremiumStateDataCopyWithImpl<$Res>
    implements $PremiumStateDataCopyWith<$Res> {
  _$PremiumStateDataCopyWithImpl(this._self, this._then);

  final PremiumStateData _self;
  final $Res Function(PremiumStateData) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? selectedOffer = freezed,}) {
  return _then(PremiumStateData(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<SubscriptionProduct>,selectedOffer: freezed == selectedOffer ? _self.selectedOffer : selectedOffer // ignore: cast_nullable_to_non_nullable
as SubscriptionProduct?,
  ));
}


}

/// @nodoc


class PremiumStateActive extends PremiumState {
  const PremiumStateActive({this.activeOffer}): super._();
  

 final  SubscriptionProduct? activeOffer;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateActiveCopyWith<PremiumStateActive> get copyWith => _$PremiumStateActiveCopyWithImpl<PremiumStateActive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateActive&&(identical(other.activeOffer, activeOffer) || other.activeOffer == activeOffer));
}


@override
int get hashCode => Object.hash(runtimeType,activeOffer);

@override
String toString() {
  return 'PremiumState.active(activeOffer: $activeOffer)';
}


}

/// @nodoc
abstract mixin class $PremiumStateActiveCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStateActiveCopyWith(PremiumStateActive value, $Res Function(PremiumStateActive) _then) = _$PremiumStateActiveCopyWithImpl;
@useResult
$Res call({
 SubscriptionProduct? activeOffer
});




}
/// @nodoc
class _$PremiumStateActiveCopyWithImpl<$Res>
    implements $PremiumStateActiveCopyWith<$Res> {
  _$PremiumStateActiveCopyWithImpl(this._self, this._then);

  final PremiumStateActive _self;
  final $Res Function(PremiumStateActive) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activeOffer = freezed,}) {
  return _then(PremiumStateActive(
activeOffer: freezed == activeOffer ? _self.activeOffer : activeOffer // ignore: cast_nullable_to_non_nullable
as SubscriptionProduct?,
  ));
}


}

/// @nodoc


class PremiumStateSending extends PremiumState {
  const PremiumStateSending({required final  List<SubscriptionProduct> offers, required this.isPremium, this.selectedOffer}): _offers = offers,super._();
  

 final  List<SubscriptionProduct> _offers;
 List<SubscriptionProduct> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  bool isPremium;
 final  SubscriptionProduct? selectedOffer;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateSendingCopyWith<PremiumStateSending> get copyWith => _$PremiumStateSendingCopyWithImpl<PremiumStateSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStateSending&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.selectedOffer, selectedOffer) || other.selectedOffer == selectedOffer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),isPremium,selectedOffer);

@override
String toString() {
  return 'PremiumState.sending(offers: $offers, isPremium: $isPremium, selectedOffer: $selectedOffer)';
}


}

/// @nodoc
abstract mixin class $PremiumStateSendingCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory $PremiumStateSendingCopyWith(PremiumStateSending value, $Res Function(PremiumStateSending) _then) = _$PremiumStateSendingCopyWithImpl;
@useResult
$Res call({
 List<SubscriptionProduct> offers, bool isPremium, SubscriptionProduct? selectedOffer
});




}
/// @nodoc
class _$PremiumStateSendingCopyWithImpl<$Res>
    implements $PremiumStateSendingCopyWith<$Res> {
  _$PremiumStateSendingCopyWithImpl(this._self, this._then);

  final PremiumStateSending _self;
  final $Res Function(PremiumStateSending) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? isPremium = null,Object? selectedOffer = freezed,}) {
  return _then(PremiumStateSending(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<SubscriptionProduct>,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,selectedOffer: freezed == selectedOffer ? _self.selectedOffer : selectedOffer // ignore: cast_nullable_to_non_nullable
as SubscriptionProduct?,
  ));
}


}

// dart format on
