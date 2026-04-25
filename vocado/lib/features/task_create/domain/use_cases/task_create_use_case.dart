import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';
import 'package:vocado/features/task_create/domain/repositories/task_create_repository_domain.dart';

@lazySingleton
class TaskCreateUseCase {
  final TaskCreateRepositoryDomain _repositoryData;

  TaskCreateUseCase(this._repositoryData);

  Future<Result<TaskCreateEntity, Failure>> getTaskCreate(File audio) async {
    return _repositoryData.getTaskCreate(audio);
  }

  Future<Result<void, Failure>> saveTask(TaskCreateEntity newTask) async {
    return _repositoryData.saveTask(newTask);
  }
}
