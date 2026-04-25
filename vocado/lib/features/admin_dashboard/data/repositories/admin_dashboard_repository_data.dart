
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';

import 'package:vocado/features/admin_dashboard/data/datasources/admin_dashboard_remote_data_source.dart';
import 'package:vocado/features/admin_dashboard/data/models/admin_dashboard_model.dart';
import 'package:vocado/features/admin_dashboard/domain/repositories/admin_dashboard_repository_domain.dart';

@LazySingleton(as: AdminDashboardRepositoryDomain)
class AdminDashboardRepositoryData implements AdminDashboardRepositoryDomain{
  final BaseAdminDashboardRemoteDataSource remoteDataSource;


  AdminDashboardRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<AdminDashboardEntity>, Failure>> getAdminDashboard() async {
    try {
      final response = await remoteDataSource.getAdminDashboard();
      return Success(response.map((item) => item.toEntity()).toList());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
