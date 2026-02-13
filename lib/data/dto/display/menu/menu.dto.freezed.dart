// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuDto {

 int? get tabId; String? get title;
/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuDtoCopyWith<MenuDto> get copyWith => _$MenuDtoCopyWithImpl<MenuDto>(this as MenuDto, _$identity);

  /// Serializes this MenuDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuDto&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabId,title);

@override
String toString() {
  return 'MenuDto(tabId: $tabId, title: $title)';
}


}

/// @nodoc
abstract mixin class $MenuDtoCopyWith<$Res>  {
  factory $MenuDtoCopyWith(MenuDto value, $Res Function(MenuDto) _then) = _$MenuDtoCopyWithImpl;
@useResult
$Res call({
 int? tabId, String? title
});




}
/// @nodoc
class _$MenuDtoCopyWithImpl<$Res>
    implements $MenuDtoCopyWith<$Res> {
  _$MenuDtoCopyWithImpl(this._self, this._then);

  final MenuDto _self;
  final $Res Function(MenuDto) _then;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabId = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
tabId: freezed == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuDto].
extension MenuDtoPatterns on MenuDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuDto value)  $default,){
final _that = this;
switch (_that) {
case _MenuDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuDto value)?  $default,){
final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tabId,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that.tabId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tabId,  String? title)  $default,) {final _that = this;
switch (_that) {
case _MenuDto():
return $default(_that.tabId,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tabId,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that.tabId,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuDto implements MenuDto {
  const _MenuDto({this.tabId = -1, this.title = ''});
  factory _MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);

@override@JsonKey() final  int? tabId;
@override@JsonKey() final  String? title;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuDtoCopyWith<_MenuDto> get copyWith => __$MenuDtoCopyWithImpl<_MenuDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuDto&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabId,title);

@override
String toString() {
  return 'MenuDto(tabId: $tabId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$MenuDtoCopyWith<$Res> implements $MenuDtoCopyWith<$Res> {
  factory _$MenuDtoCopyWith(_MenuDto value, $Res Function(_MenuDto) _then) = __$MenuDtoCopyWithImpl;
@override @useResult
$Res call({
 int? tabId, String? title
});




}
/// @nodoc
class __$MenuDtoCopyWithImpl<$Res>
    implements _$MenuDtoCopyWith<$Res> {
  __$MenuDtoCopyWithImpl(this._self, this._then);

  final _MenuDto _self;
  final $Res Function(_MenuDto) _then;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabId = freezed,Object? title = freezed,}) {
  return _then(_MenuDto(
tabId: freezed == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
