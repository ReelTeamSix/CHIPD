// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureRequest {

 String get id; DateTime get creationDate; String get title; String get description; int get votes;
/// Create a copy of FeatureRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestCopyWith<FeatureRequest> get copyWith => _$FeatureRequestCopyWithImpl<FeatureRequest>(this as FeatureRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.votes, votes) || other.votes == votes));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,votes);

@override
String toString() {
  return 'FeatureRequest(id: $id, creationDate: $creationDate, title: $title, description: $description, votes: $votes)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestCopyWith<$Res>  {
  factory $FeatureRequestCopyWith(FeatureRequest value, $Res Function(FeatureRequest) _then) = _$FeatureRequestCopyWithImpl;
@useResult
$Res call({
 String id, DateTime creationDate, String title, String description, int votes
});




}
/// @nodoc
class _$FeatureRequestCopyWithImpl<$Res>
    implements $FeatureRequestCopyWith<$Res> {
  _$FeatureRequestCopyWithImpl(this._self, this._then);

  final FeatureRequest _self;
  final $Res Function(FeatureRequest) _then;

/// Create a copy of FeatureRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationDate = null,Object? title = null,Object? description = null,Object? votes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureRequest].
extension FeatureRequestPatterns on FeatureRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( FeatureRequestData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeatureRequestData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( FeatureRequestData value)  $default,){
final _that = this;
switch (_that) {
case FeatureRequestData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( FeatureRequestData value)?  $default,){
final _that = this;
switch (_that) {
case FeatureRequestData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime creationDate,  String title,  String description,  int votes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeatureRequestData() when $default != null:
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.votes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime creationDate,  String title,  String description,  int votes)  $default,) {final _that = this;
switch (_that) {
case FeatureRequestData():
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.votes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime creationDate,  String title,  String description,  int votes)?  $default,) {final _that = this;
switch (_that) {
case FeatureRequestData() when $default != null:
return $default(_that.id,_that.creationDate,_that.title,_that.description,_that.votes);case _:
  return null;

}
}

}

/// @nodoc


class FeatureRequestData extends FeatureRequest {
  const FeatureRequestData({required this.id, required this.creationDate, required this.title, required this.description, required this.votes}): super._();
  

@override final  String id;
@override final  DateTime creationDate;
@override final  String title;
@override final  String description;
@override final  int votes;

/// Create a copy of FeatureRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestDataCopyWith<FeatureRequestData> get copyWith => _$FeatureRequestDataCopyWithImpl<FeatureRequestData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.votes, votes) || other.votes == votes));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,votes);

@override
String toString() {
  return 'FeatureRequest(id: $id, creationDate: $creationDate, title: $title, description: $description, votes: $votes)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestDataCopyWith<$Res> implements $FeatureRequestCopyWith<$Res> {
  factory $FeatureRequestDataCopyWith(FeatureRequestData value, $Res Function(FeatureRequestData) _then) = _$FeatureRequestDataCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime creationDate, String title, String description, int votes
});




}
/// @nodoc
class _$FeatureRequestDataCopyWithImpl<$Res>
    implements $FeatureRequestDataCopyWith<$Res> {
  _$FeatureRequestDataCopyWithImpl(this._self, this._then);

  final FeatureRequestData _self;
  final $Res Function(FeatureRequestData) _then;

/// Create a copy of FeatureRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = null,Object? title = null,Object? description = null,Object? votes = null,}) {
  return _then(FeatureRequestData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FeatureRequestVote {

 String get id; String get featureId;
/// Create a copy of FeatureRequestVote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestVoteCopyWith<FeatureRequestVote> get copyWith => _$FeatureRequestVoteCopyWithImpl<FeatureRequestVote>(this as FeatureRequestVote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestVote&&(identical(other.id, id) || other.id == id)&&(identical(other.featureId, featureId) || other.featureId == featureId));
}


@override
int get hashCode => Object.hash(runtimeType,id,featureId);

@override
String toString() {
  return 'FeatureRequestVote(id: $id, featureId: $featureId)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestVoteCopyWith<$Res>  {
  factory $FeatureRequestVoteCopyWith(FeatureRequestVote value, $Res Function(FeatureRequestVote) _then) = _$FeatureRequestVoteCopyWithImpl;
@useResult
$Res call({
 String id, String featureId
});




}
/// @nodoc
class _$FeatureRequestVoteCopyWithImpl<$Res>
    implements $FeatureRequestVoteCopyWith<$Res> {
  _$FeatureRequestVoteCopyWithImpl(this._self, this._then);

  final FeatureRequestVote _self;
  final $Res Function(FeatureRequestVote) _then;

/// Create a copy of FeatureRequestVote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? featureId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,featureId: null == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureRequestVote].
extension FeatureRequestVotePatterns on FeatureRequestVote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( FeatureRequestVoteData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeatureRequestVoteData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( FeatureRequestVoteData value)  $default,){
final _that = this;
switch (_that) {
case FeatureRequestVoteData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( FeatureRequestVoteData value)?  $default,){
final _that = this;
switch (_that) {
case FeatureRequestVoteData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String featureId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeatureRequestVoteData() when $default != null:
return $default(_that.id,_that.featureId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String featureId)  $default,) {final _that = this;
switch (_that) {
case FeatureRequestVoteData():
return $default(_that.id,_that.featureId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String featureId)?  $default,) {final _that = this;
switch (_that) {
case FeatureRequestVoteData() when $default != null:
return $default(_that.id,_that.featureId);case _:
  return null;

}
}

}

/// @nodoc


class FeatureRequestVoteData extends FeatureRequestVote {
  const FeatureRequestVoteData({required this.id, required this.featureId}): super._();
  

@override final  String id;
@override final  String featureId;

/// Create a copy of FeatureRequestVote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestVoteDataCopyWith<FeatureRequestVoteData> get copyWith => _$FeatureRequestVoteDataCopyWithImpl<FeatureRequestVoteData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestVoteData&&(identical(other.id, id) || other.id == id)&&(identical(other.featureId, featureId) || other.featureId == featureId));
}


@override
int get hashCode => Object.hash(runtimeType,id,featureId);

@override
String toString() {
  return 'FeatureRequestVote(id: $id, featureId: $featureId)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestVoteDataCopyWith<$Res> implements $FeatureRequestVoteCopyWith<$Res> {
  factory $FeatureRequestVoteDataCopyWith(FeatureRequestVoteData value, $Res Function(FeatureRequestVoteData) _then) = _$FeatureRequestVoteDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String featureId
});




}
/// @nodoc
class _$FeatureRequestVoteDataCopyWithImpl<$Res>
    implements $FeatureRequestVoteDataCopyWith<$Res> {
  _$FeatureRequestVoteDataCopyWithImpl(this._self, this._then);

  final FeatureRequestVoteData _self;
  final $Res Function(FeatureRequestVoteData) _then;

/// Create a copy of FeatureRequestVote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? featureId = null,}) {
  return _then(FeatureRequestVoteData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,featureId: null == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
