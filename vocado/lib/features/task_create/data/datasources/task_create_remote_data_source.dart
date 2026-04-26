import 'dart:developer';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/google_gemini.dart';
import 'package:vocado/core/services/service_user.dart';
import 'package:vocado/core/services/speech_to_text.dart';
import 'package:vocado/features/task_create/data/models/task_create_model.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';

abstract class BaseTaskCreateRemoteDataSource {
  Future<TaskCreateModel> getTaskCreate(File audio);
  Future<void> saveTask(TaskCreateEntity newTask);
}

@LazySingleton(as: BaseTaskCreateRemoteDataSource)
class TaskCreateRemoteDataSource implements BaseTaskCreateRemoteDataSource {
  final SupabaseClient _supabase;
  final SpeechToText _speechToText;
  final GoogleGemini _googleGemini;
  final ServiceUser _serviceUser;

  TaskCreateRemoteDataSource(
    this._supabase,
    this._googleGemini,
    this._speechToText,
    this._serviceUser,
  );

  @override
  Future<TaskCreateModel> getTaskCreate(File audio) async {
    final transcript = await _speechToText.transcriptAudio(audio);

    final taskJson = await _googleGemini.getTaskStructured(
      content: transcript['english'],
    );

    return TaskCreateModel.fromJson(taskJson);
  }

  @override
  Future<void> saveTask(TaskCreateEntity newTask) async {
    final assignee = await _supabase
        .from('users')
        .select()
        .ilike('name', '%${newTask.assignee}%');

    if (assignee.isEmpty) {
      throw Exception('No User found for "${newTask.assignee}" found.');
    }

    log(assignee.toString());

    final isMember = await _supabase
        .from('members')
        .select()
        .eq('user_id', assignee[0]['id']);

    if (isMember.isEmpty) {
      throw Exception(
        'No Member found for "${newTask.assignee}" found. Please add member first',
      );
    }

    await _supabase.from('tasks').insert({
      "task": newTask.task,
      "assignee_id": assignee[0]['id'],
      "assigned_by": _serviceUser.currentUser!.id,
      "due_date": newTask.dueDate.toIso8601String(),
    });
  }
}
