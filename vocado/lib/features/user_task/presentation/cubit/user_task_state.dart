import 'package:equatable/equatable.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

sealed class UserTaskState extends Equatable {
  const UserTaskState();

  @override
  List<Object?> get props => [];
}

class UserTaskInitialState extends UserTaskState {}

class UserTaskLoadingState extends UserTaskState {}

class UserTaskSuccessState extends UserTaskState {
  final List<UserTaskEntity> tasks;

  const UserTaskSuccessState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class UserTaskErrorState extends UserTaskState {
  final String message;

  const UserTaskErrorState(this.message);

  @override
  List<Object?> get props => [message];
}