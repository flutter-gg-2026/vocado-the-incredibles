// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskCreateModel _$TaskCreateModelFromJson(Map<String, dynamic> json) =>
    _TaskCreateModel(
      task: json['task'] as String,
      assignee: json['assignee'] as String,
      dueDate: DateTime.parse(json['due_date'] as String),
    );

Map<String, dynamic> _$TaskCreateModelToJson(_TaskCreateModel instance) =>
    <String, dynamic>{
      'task': instance.task,
      'assignee': instance.assignee,
      'due_date': instance.dueDate.toIso8601String(),
    };
