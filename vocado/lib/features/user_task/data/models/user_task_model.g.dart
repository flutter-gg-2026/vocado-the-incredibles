// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTaskModel _$UserTaskModelFromJson(Map<String, dynamic> json) =>
    _UserTaskModel(
      id: json['id'] as String,
      title: json['task'] as String,
      status: json['completed'] as bool,
      dueDate: DateTime.parse(json['due_date'] as String),
    );

Map<String, dynamic> _$UserTaskModelToJson(_UserTaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.title,
      'completed': instance.status,
      'due_date': instance.dueDate.toIso8601String(),
    };
