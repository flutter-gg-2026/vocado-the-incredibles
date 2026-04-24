import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/admin_dashboard/data/models/admin_dashboard_model.dart';

abstract class BaseAdminDashboardRemoteDataSource {
  Future<List<AdminDashboardModel>> getAdminDashboard();
}

@LazySingleton(as: BaseAdminDashboardRemoteDataSource)
class AdminDashboardRemoteDataSource
    implements BaseAdminDashboardRemoteDataSource {
  final SupabaseClient _supabase;

  AdminDashboardRemoteDataSource(this._supabase);

  @override
  Future<List<AdminDashboardModel>> getAdminDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    final tasks = await _supabase.from('tasks').select().eq('assigned_by', '27213c3d-1cd2-4a5c-96f9-3c7d312cc1eb');
    return tasks.map((json) => AdminDashboardModel.fromJson(json)).toList();
    /* return List.generate(
      10,
      (index) => AdminDashboardModel(
        id: '546984rwegf',
        task: 'Sending Manger Files',
        assignee: 'Hatem',
        assigneeId: '6eh5r1t6',
        dueDate: DateTime(2026, 4, 20),
        completed: false,
      ),
    ); */
  }
}
