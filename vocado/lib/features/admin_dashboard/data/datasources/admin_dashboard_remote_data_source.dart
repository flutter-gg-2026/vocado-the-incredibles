import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/serviceUser.dart';
import 'package:vocado/features/admin_dashboard/data/models/admin_dashboard_model.dart';

abstract class BaseAdminDashboardRemoteDataSource {
  Future<List<AdminDashboardModel>> getAdminDashboard();
}

@LazySingleton(as: BaseAdminDashboardRemoteDataSource)
class AdminDashboardRemoteDataSource
    implements BaseAdminDashboardRemoteDataSource {
  final SupabaseClient _supabase;
  final ServiceUser _serviceUser;

  AdminDashboardRemoteDataSource(this._supabase, this._serviceUser);

  @override
  Future<List<AdminDashboardModel>> getAdminDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    final tasks = await _supabase
        .from('tasks')
        .select()
        .eq('assigned_by', _serviceUser.currentUser!.id);
    return tasks.map((json) => AdminDashboardModel.fromJson(json)).toList();
  }
}
