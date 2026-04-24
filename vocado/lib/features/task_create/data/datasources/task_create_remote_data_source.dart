import 'dart:developer';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:vocado/core/services/google_gemini.dart';
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

  TaskCreateRemoteDataSource(
    this._supabase,
    this._googleGemini,
    this._speechToText,
  );

  @override
  Future<TaskCreateModel> getTaskCreate(File audio) async {
    await Future.delayed(Duration(seconds: 1));
    /* final transcript = await _speechToText.transcriptAudio(audio);

    log(transcript.toString()); */

    final taskJson = await _googleGemini.getTaskStructured(
      content:
          'Hatem, please finish the proposal; the required deadline is April 25, 2025',
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
      throw Exception('No Member found.');
    }

    await _supabase.from('tasks').insert({
      "task": newTask.task,
      "assignee_id": assignee[0]['id'],
      "assigned_by": "27213c3d-1cd2-4a5c-96f9-3c7d312cc1eb",
      "due_date": newTask.dueDate.toIso8601String(),
    });
  }
}
