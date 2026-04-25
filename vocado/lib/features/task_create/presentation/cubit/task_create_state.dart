import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';

abstract class TaskCreateState extends Equatable {
  const TaskCreateState();

  @override
  List<Object?> get props => [];
}

class TaskCreateInitialState extends TaskCreateState {}

class TaskCreateLoadingState extends TaskCreateState {}

class TaskCreateSuccessState extends TaskCreateState {
  final TaskCreateEntity task;
  final bool? isSaved;

  const TaskCreateSuccessState({required this.task, this.isSaved});

  @override
  List<Object?> get props => [task, isSaved];
}

class TaskCreateErrorState extends TaskCreateState {
  final String message;
  const TaskCreateErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
