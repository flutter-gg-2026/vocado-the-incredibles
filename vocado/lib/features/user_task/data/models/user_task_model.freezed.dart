// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTaskModel {

 String get id;@JsonKey(name: 'task') String get title;@JsonKey(name: 'completed') bool get status;@JsonKey(name: 'due_date') DateTime get dueDate; String get name;
/// Create a copy of UserTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTaskModelCopyWith<UserTaskModel> get copyWith => _$UserTaskModelCopyWithImpl<UserTaskModel>(this as UserTaskModel, _$identity);

  /// Serializes this UserTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,dueDate,name);

@override
String toString() {
  return 'UserTaskModel(id: $id, title: $title, status: $status, dueDate: $dueDate, name: $name)';
}


}

/// @nodoc
abstract mixin class $UserTaskModelCopyWith<$Res>  {
  factory $UserTaskModelCopyWith(UserTaskModel value, $Res Function(UserTaskModel) _then) = _$UserTaskModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'task') String title,@JsonKey(name: 'completed') bool status,@JsonKey(name: 'due_date') DateTime dueDate, String name
});




}
/// @nodoc
class _$UserTaskModelCopyWithImpl<$Res>
    implements $UserTaskModelCopyWith<$Res> {
  _$UserTaskModelCopyWithImpl(this._self, this._then);

  final UserTaskModel _self;
  final $Res Function(UserTaskModel) _then;

/// Create a copy of UserTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? status = null,Object? dueDate = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTaskModel].
extension UserTaskModelPatterns on UserTaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _UserTaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserTaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'task')  String title, @JsonKey(name: 'completed')  bool status, @JsonKey(name: 'due_date')  DateTime dueDate,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTaskModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'task')  String title, @JsonKey(name: 'completed')  bool status, @JsonKey(name: 'due_date')  DateTime dueDate,  String name)  $default,) {final _that = this;
switch (_that) {
case _UserTaskModel():
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'task')  String title, @JsonKey(name: 'completed')  bool status, @JsonKey(name: 'due_date')  DateTime dueDate,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UserTaskModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTaskModel implements UserTaskModel {
  const _UserTaskModel({required this.id, @JsonKey(name: 'task') required this.title, @JsonKey(name: 'completed') required this.status, @JsonKey(name: 'due_date') required this.dueDate, required this.name});
  factory _UserTaskModel.fromJson(Map<String, dynamic> json) => _$UserTaskModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'task') final  String title;
@override@JsonKey(name: 'completed') final  bool status;
@override@JsonKey(name: 'due_date') final  DateTime dueDate;
@override final  String name;

/// Create a copy of UserTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTaskModelCopyWith<_UserTaskModel> get copyWith => __$UserTaskModelCopyWithImpl<_UserTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,dueDate,name);

@override
String toString() {
  return 'UserTaskModel(id: $id, title: $title, status: $status, dueDate: $dueDate, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserTaskModelCopyWith<$Res> implements $UserTaskModelCopyWith<$Res> {
  factory _$UserTaskModelCopyWith(_UserTaskModel value, $Res Function(_UserTaskModel) _then) = __$UserTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'task') String title,@JsonKey(name: 'completed') bool status,@JsonKey(name: 'due_date') DateTime dueDate, String name
});




}
/// @nodoc
class __$UserTaskModelCopyWithImpl<$Res>
    implements _$UserTaskModelCopyWith<$Res> {
  __$UserTaskModelCopyWithImpl(this._self, this._then);

  final _UserTaskModel _self;
  final $Res Function(_UserTaskModel) _then;

/// Create a copy of UserTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? status = null,Object? dueDate = null,Object? name = null,}) {
  return _then(_UserTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
