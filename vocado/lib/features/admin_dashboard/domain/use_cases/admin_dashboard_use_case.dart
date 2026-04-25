import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:vocado/features/admin_dashboard/domain/repositories/admin_dashboard_repository_domain.dart';

@lazySingleton
class AdminDashboardUseCase {
  final AdminDashboardRepositoryDomain _repositoryData;

  AdminDashboardUseCase(this._repositoryData);

  Future<Result<List<AdminDashboardEntity>, Failure>>
  getAdminDashboard() async {
    return _repositoryData.getAdminDashboard();
  }

  Future<Result<void, Failure>> removeTask(AdminDashboardEntity task) {
    return _repositoryData.removeTask(task);
  }
}
