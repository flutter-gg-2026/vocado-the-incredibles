import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';

abstract class AdminDashboardRepositoryDomain {
    Future<Result<List<AdminDashboardEntity>, Failure>> getAdminDashboard();
    Future<Result<void, Failure>> removeTask(AdminDashboardEntity task);
}
