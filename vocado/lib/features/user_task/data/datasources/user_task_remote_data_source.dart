import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/user_task/data/models/user_task_model.dart';

abstract class BaseUserTaskRemoteDataSource {
  Future<List<UserTaskModel>> getUserTasks();
}

@LazySingleton(as: BaseUserTaskRemoteDataSource)
class UserTaskRemoteDataSource implements BaseUserTaskRemoteDataSource {
  final SupabaseClient _supabase;

  UserTaskRemoteDataSource(this._supabase);

  @override
  Future<List<UserTaskModel>> getUserTasks() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        return [];
      }
      final response = await _supabase
          .from('tasks')
          .select('''
      id,
      task,
      completed,
      due_date,
      user:users!tasks_assignee_id_fkey(
        name
      )
    ''')
          .eq('assignee_id', userId);
      return response.map((json) => UserTaskModel.fromJson(json)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
