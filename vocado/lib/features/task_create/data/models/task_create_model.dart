import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_create_model.freezed.dart';
part 'task_create_model.g.dart';

@freezed
abstract class TaskCreateModel with _$TaskCreateModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory TaskCreateModel({
    required String task,
    required String assignee,
    required DateTime dueDate,
    
  }) = _TaskCreateModel;

  factory TaskCreateModel.fromJson(Map<String, Object?> json) => _$TaskCreateModelFromJson(json);
}



extension TaskCreateModelMapper on TaskCreateModel {
  TaskCreateEntity toEntity() {
    return TaskCreateEntity(task: task, assignee: assignee, dueDate: dueDate);
  }
  }