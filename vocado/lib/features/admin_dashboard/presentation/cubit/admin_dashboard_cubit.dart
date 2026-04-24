import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/admin_dashboard/domain/use_cases/admin_dashboard_use_case.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_state.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  final AdminDashboardUseCase _adminDashboardUseCase;

  AdminDashboardCubit(this._adminDashboardUseCase) : super(AdminDashboardInitialState());

  Future<void> getAdminDashboardMethod() async {
    final result = await _adminDashboardUseCase.getAdminDashboard();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
