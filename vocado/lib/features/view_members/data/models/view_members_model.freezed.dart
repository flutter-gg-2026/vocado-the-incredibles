// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_members_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewMembersModel {

 String get id; String get name; String get email; String get role;
/// Create a copy of ViewMembersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewMembersModelCopyWith<ViewMembersModel> get copyWith => _$ViewMembersModelCopyWithImpl<ViewMembersModel>(this as ViewMembersModel, _$identity);

  /// Serializes this ViewMembersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewMembersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role);

@override
String toString() {
  return 'ViewMembersModel(id: $id, name: $name, email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class $ViewMembersModelCopyWith<$Res>  {
  factory $ViewMembersModelCopyWith(ViewMembersModel value, $Res Function(ViewMembersModel) _then) = _$ViewMembersModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String role
});




}
/// @nodoc
class _$ViewMembersModelCopyWithImpl<$Res>
    implements $ViewMembersModelCopyWith<$Res> {
  _$ViewMembersModelCopyWithImpl(this._self, this._then);

  final ViewMembersModel _self;
  final $Res Function(ViewMembersModel) _then;

/// Create a copy of ViewMembersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewMembersModel].
extension ViewMembersModelPatterns on ViewMembersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewMembersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewMembersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewMembersModel value)  $default,){
final _that = this;
switch (_that) {
case _ViewMembersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewMembersModel value)?  $default,){
final _that = this;
switch (_that) {
case _ViewMembersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewMembersModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role)  $default,) {final _that = this;
switch (_that) {
case _ViewMembersModel():
return $default(_that.id,_that.name,_that.email,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String role)?  $default,) {final _that = this;
switch (_that) {
case _ViewMembersModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewMembersModel implements ViewMembersModel {
  const _ViewMembersModel({required this.id, required this.name, required this.email, required this.role});
  factory _ViewMembersModel.fromJson(Map<String, dynamic> json) => _$ViewMembersModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String role;

/// Create a copy of ViewMembersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewMembersModelCopyWith<_ViewMembersModel> get copyWith => __$ViewMembersModelCopyWithImpl<_ViewMembersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewMembersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewMembersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role);

@override
String toString() {
  return 'ViewMembersModel(id: $id, name: $name, email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class _$ViewMembersModelCopyWith<$Res> implements $ViewMembersModelCopyWith<$Res> {
  factory _$ViewMembersModelCopyWith(_ViewMembersModel value, $Res Function(_ViewMembersModel) _then) = __$ViewMembersModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String role
});




}
/// @nodoc
class __$ViewMembersModelCopyWithImpl<$Res>
    implements _$ViewMembersModelCopyWith<$Res> {
  __$ViewMembersModelCopyWithImpl(this._self, this._then);

  final _ViewMembersModel _self;
  final $Res Function(_ViewMembersModel) _then;

/// Create a copy of ViewMembersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,}) {
  return _then(_ViewMembersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
