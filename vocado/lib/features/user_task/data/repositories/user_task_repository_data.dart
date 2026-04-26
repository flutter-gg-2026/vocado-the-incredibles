import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/user_task/data/datasources/user_task_remote_data_source.dart';
import 'package:vocado/features/user_task/data/models/user_task_model.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';
import 'package:vocado/features/user_task/domain/repositories/user_task_repository_domain.dart';

@LazySingleton(as: UserTaskRepositoryDomain)
class UserTaskRepository implements UserTaskRepositoryDomain {
  final BaseUserTaskRemoteDataSource _remoteDataSource;

  UserTaskRepository(this._remoteDataSource);

  @override
  Future<Result<List<UserTaskEntity>, Failure>> getUserTasks() async {
    try {
      final result = await _remoteDataSource.getUserTasks();

      final tasks = result.map((task) => task.toEntity()).toList();

      return Success(tasks);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  @override
Future<Result<void, Failure>> markTaskDone(String taskId) async {
  try {
    await _remoteDataSource.markTaskDone(taskId);
    return const Success(null);
  } catch (error) {
    return Error(FailureExceptions.getException(error));
  }
}
}