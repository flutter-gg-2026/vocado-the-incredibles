import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:vocado/features/admin_dashboard/domain/use_cases/admin_dashboard_use_case.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_state.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  final AdminDashboardUseCase _adminDashboardUseCase;

  AdminDashboardCubit(this._adminDashboardUseCase)
    : super(AdminDashboardInitialState()) {
    getAdminDashboardMethod();
  }

  Future<void> getAdminDashboardMethod() async {
    emit(AdminDashboardInitialState());
    final result = await _adminDashboardUseCase.getAdminDashboard();
    result.when(
      (success) {
        emit(AdminDashboardSuccessState(tasks: success));
      },
      (whenError) {
        emit(AdminDashboardErrorState(message: whenError.message));
      },
    );
  }

  Future<void> removeTask(
    List<AdminDashboardEntity> taskList,
    AdminDashboardEntity task,
  ) async {
    final List<AdminDashboardEntity> newList = List.from(taskList)
      ..removeWhere((element) => element == task);
    emit(AdminDashboardSuccessState(tasks: newList));

    final result = await _adminDashboardUseCase.removeTask(task);
    result.when((success) {}, (whenError) {
      emit(AdminDashboardSuccessState(tasks: taskList));
      emit(AdminDashboardErrorState(message: whenError.message));
    });
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
