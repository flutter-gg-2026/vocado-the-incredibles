// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_members_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddMembersModel {

 String get id; String get name; String get email;
/// Create a copy of AddMembersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMembersModelCopyWith<AddMembersModel> get copyWith => _$AddMembersModelCopyWithImpl<AddMembersModel>(this as AddMembersModel, _$identity);

  /// Serializes this AddMembersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMembersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'AddMembersModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $AddMembersModelCopyWith<$Res>  {
  factory $AddMembersModelCopyWith(AddMembersModel value, $Res Function(AddMembersModel) _then) = _$AddMembersModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email
});




}
/// @nodoc
class _$AddMembersModelCopyWithImpl<$Res>
    implements $AddMembersModelCopyWith<$Res> {
  _$AddMembersModelCopyWithImpl(this._self, this._then);

  final AddMembersModel _self;
  final $Res Function(AddMembersModel) _then;

/// Create a copy of AddMembersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddMembersModel].
extension AddMembersModelPatterns on AddMembersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddMembersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddMembersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddMembersModel value)  $default,){
final _that = this;
switch (_that) {
case _AddMembersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddMembersModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddMembersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddMembersModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _AddMembersModel():
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _AddMembersModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddMembersModel implements AddMembersModel {
  const _AddMembersModel({required this.id, required this.name, required this.email});
  factory _AddMembersModel.fromJson(Map<String, dynamic> json) => _$AddMembersModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;

/// Create a copy of AddMembersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddMembersModelCopyWith<_AddMembersModel> get copyWith => __$AddMembersModelCopyWithImpl<_AddMembersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddMembersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMembersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'AddMembersModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$AddMembersModelCopyWith<$Res> implements $AddMembersModelCopyWith<$Res> {
  factory _$AddMembersModelCopyWith(_AddMembersModel value, $Res Function(_AddMembersModel) _then) = __$AddMembersModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email
});




}
/// @nodoc
class __$AddMembersModelCopyWithImpl<$Res>
    implements _$AddMembersModelCopyWith<$Res> {
  __$AddMembersModelCopyWithImpl(this._self, this._then);

  final _AddMembersModel _self;
  final $Res Function(_AddMembersModel) _then;

/// Create a copy of AddMembersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_AddMembersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
