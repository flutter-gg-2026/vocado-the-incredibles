import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_create/domain/use_cases/task_create_use_case.dart';
import 'package:vocado/features/task_create/presentation/cubit/task_create_state.dart';

class TaskCreateCubit extends Cubit<TaskCreateState> {
  final TaskCreateUseCase _taskCreateUseCase;

  TaskCreateCubit(this._taskCreateUseCase) : super(TaskCreateInitialState());

  Future<void> getTaskCreateMethod(File audio) async {
    emit(TaskCreateLoadingState());
    final result = await _taskCreateUseCase.getTaskCreate(audio);
    result.when(
      (success) {
        emit(TaskCreateSuccessState(task: success));
      },
      (whenError) {
        emit(TaskCreateErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
