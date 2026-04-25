// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminDashboardModel {

 String get id; String get task; String? get assignee; String get assigneeId; DateTime get dueDate; bool get completed;
/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDashboardModelCopyWith<AdminDashboardModel> get copyWith => _$AdminDashboardModelCopyWithImpl<AdminDashboardModel>(this as AdminDashboardModel, _$identity);

  /// Serializes this AdminDashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.assignee, assignee) || other.assignee == assignee)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,assignee,assigneeId,dueDate,completed);

@override
String toString() {
  return 'AdminDashboardModel(id: $id, task: $task, assignee: $assignee, assigneeId: $assigneeId, dueDate: $dueDate, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $AdminDashboardModelCopyWith<$Res>  {
  factory $AdminDashboardModelCopyWith(AdminDashboardModel value, $Res Function(AdminDashboardModel) _then) = _$AdminDashboardModelCopyWithImpl;
@useResult
$Res call({
 String id, String task, String? assignee, String assigneeId, DateTime dueDate, bool completed
});




}
/// @nodoc
class _$AdminDashboardModelCopyWithImpl<$Res>
    implements $AdminDashboardModelCopyWith<$Res> {
  _$AdminDashboardModelCopyWithImpl(this._self, this._then);

  final AdminDashboardModel _self;
  final $Res Function(AdminDashboardModel) _then;

/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? task = null,Object? assignee = freezed,Object? assigneeId = null,Object? dueDate = null,Object? completed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,assignee: freezed == assignee ? _self.assignee : assignee // ignore: cast_nullable_to_non_nullable
as String?,assigneeId: null == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminDashboardModel].
extension AdminDashboardModelPatterns on AdminDashboardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminDashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminDashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminDashboardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminDashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String task,  String? assignee,  String assigneeId,  DateTime dueDate,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
return $default(_that.id,_that.task,_that.assignee,_that.assigneeId,_that.dueDate,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String task,  String? assignee,  String assigneeId,  DateTime dueDate,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _AdminDashboardModel():
return $default(_that.id,_that.task,_that.assignee,_that.assigneeId,_that.dueDate,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String task,  String? assignee,  String assigneeId,  DateTime dueDate,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _AdminDashboardModel() when $default != null:
return $default(_that.id,_that.task,_that.assignee,_that.assigneeId,_that.dueDate,_that.completed);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _AdminDashboardModel implements AdminDashboardModel {
  const _AdminDashboardModel({required this.id, required this.task, this.assignee, required this.assigneeId, required this.dueDate, required this.completed});
  factory _AdminDashboardModel.fromJson(Map<String, dynamic> json) => _$AdminDashboardModelFromJson(json);

@override final  String id;
@override final  String task;
@override final  String? assignee;
@override final  String assigneeId;
@override final  DateTime dueDate;
@override final  bool completed;

/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminDashboardModelCopyWith<_AdminDashboardModel> get copyWith => __$AdminDashboardModelCopyWithImpl<_AdminDashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminDashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminDashboardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.assignee, assignee) || other.assignee == assignee)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,assignee,assigneeId,dueDate,completed);

@override
String toString() {
  return 'AdminDashboardModel(id: $id, task: $task, assignee: $assignee, assigneeId: $assigneeId, dueDate: $dueDate, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$AdminDashboardModelCopyWith<$Res> implements $AdminDashboardModelCopyWith<$Res> {
  factory _$AdminDashboardModelCopyWith(_AdminDashboardModel value, $Res Function(_AdminDashboardModel) _then) = __$AdminDashboardModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String task, String? assignee, String assigneeId, DateTime dueDate, bool completed
});




}
/// @nodoc
class __$AdminDashboardModelCopyWithImpl<$Res>
    implements _$AdminDashboardModelCopyWith<$Res> {
  __$AdminDashboardModelCopyWithImpl(this._self, this._then);

  final _AdminDashboardModel _self;
  final $Res Function(_AdminDashboardModel) _then;

/// Create a copy of AdminDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? task = null,Object? assignee = freezed,Object? assigneeId = null,Object? dueDate = null,Object? completed = null,}) {
  return _then(_AdminDashboardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,assignee: freezed == assignee ? _self.assignee : assignee // ignore: cast_nullable_to_non_nullable
as String?,assigneeId: null == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
