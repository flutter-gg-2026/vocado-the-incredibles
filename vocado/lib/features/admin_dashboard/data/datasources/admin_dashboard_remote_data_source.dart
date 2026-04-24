import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/admin_dashboard/data/models/admin_dashboard_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseAdminDashboardRemoteDataSource {
  Future<AdminDashboardModel> getAdminDashboard();
}


@LazySingleton(as: BaseAdminDashboardRemoteDataSource)
class AdminDashboardRemoteDataSource implements BaseAdminDashboardRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AdminDashboardRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AdminDashboardModel> getAdminDashboard() async {
    try {
      return AdminDashboardModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
