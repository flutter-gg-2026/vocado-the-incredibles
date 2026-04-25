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
    final response = await _supabase
        .from('tasks')
        .select('*, users!assignee_id(name)')
        .eq('assigned_by', _serviceUser.currentUser!.id);

    final tasks = response.map((task) {
      task['name'] = task['users']['name'];
      task.remove('users');
      return task;
    }).toList();
    return tasks.map((json) => AdminDashboardModel.fromJson(json)).toList();
  }
}
