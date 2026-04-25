// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminDashboardModel _$AdminDashboardModelFromJson(Map<String, dynamic> json) =>
    _AdminDashboardModel(
      id: json['id'] as String,
      task: json['task'] as String,
      assignee: json['name'] as String?,
      assigneeId: json['assignee_id'] as String,
      dueDate: DateTime.parse(json['due_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$AdminDashboardModelToJson(
  _AdminDashboardModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'task': instance.task,
  'name': instance.assignee,
  'assignee_id': instance.assigneeId,
  'due_date': instance.dueDate.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'completed': instance.completed,
};
