
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';

import 'package:vocado/features/task_create/data/datasources/task_create_remote_data_source.dart';
import 'package:vocado/features/task_create/data/models/task_create_model.dart';
import 'package:vocado/features/task_create/domain/repositories/task_create_repository_domain.dart';

@LazySingleton(as: TaskCreateRepositoryDomain)
class TaskCreateRepositoryData implements TaskCreateRepositoryDomain{
  final BaseTaskCreateRemoteDataSource remoteDataSource;


  TaskCreateRepositoryData(this.remoteDataSource);

@override
  Future<Result<TaskCreateEntity, Failure>> getTaskCreate(File audio) async {
    try {
      final response = await remoteDataSource.getTaskCreate(audio);
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> saveTask(TaskCreateEntity newTask) async {
    try {
      await remoteDataSource.saveTask(newTask);
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
