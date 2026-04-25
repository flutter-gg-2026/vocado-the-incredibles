import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';

abstract class TaskCreateRepositoryDomain {
  Future<Result<TaskCreateEntity, Failure>> getTaskCreate(File audio);

  Future<Result<void, Failure>> saveTask(TaskCreateEntity newTask);
}
