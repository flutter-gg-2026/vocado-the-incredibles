import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/user_task/domain/use_cases/user_task_use_case.dart';
import 'package:vocado/features/user_task/presentation/cubit/user_task_state.dart';

@injectable
class UserTaskCubit extends Cubit<UserTaskState> {
  final UserTaskUseCase _userTaskUseCase;

  UserTaskCubit(this._userTaskUseCase) : super(UserTaskInitialState()) {
    getUserTasksMethod();
  }

  Future<void> getUserTasksMethod() async {
    emit(UserTaskLoadingState());

    final result = await _userTaskUseCase();

    result.when(
      (tasks) {
        emit(UserTaskSuccessState(tasks));
      },
      (failure) {
        emit(UserTaskErrorState(failure.message));
      },
    );
  }
}