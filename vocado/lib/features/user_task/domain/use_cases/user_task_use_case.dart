import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';
import 'package:vocado/features/user_task/domain/repositories/user_task_repository_domain.dart';

@lazySingleton
class UserTaskUseCase {
  final UserTaskRepositoryDomain _repository;

  UserTaskUseCase(this._repository);

  Future<Result<List<UserTaskEntity>, Failure>> call() {
    return _repository.getUserTasks();
  }

  Future<Result<void, Failure>> markTaskDone(String taskId) {
  return _repository.markTaskDone(taskId);
}
}