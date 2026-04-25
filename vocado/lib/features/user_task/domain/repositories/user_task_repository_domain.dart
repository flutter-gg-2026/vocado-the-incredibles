import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

abstract class UserTaskRepositoryDomain {
  Future<Result<List<UserTaskEntity>, Failure>> getUserTasks();
}