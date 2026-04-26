import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/user_task/data/models/user_task_model.dart';

abstract class BaseUserTaskRemoteDataSource {
  Future<List<UserTaskModel>> getUserTasks();
  Future<void> markTaskDone(String taskId);
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
        log('-------user null--------');
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
      log(response.toString());
      final tasks = response.map((task) {
        task['name'] = task['user']['name'];
        task.remove('user');
        return task;
      }).toList();
      return tasks.map((json) => UserTaskModel.fromJson(json)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
Future<void> markTaskDone(String taskId) async {
  try {
    await _supabase
        .from('tasks')
        .update({'completed': true})
        .eq('id', taskId);
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}
}
