import 'dart:developer';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
    /* final transcript = await _speechToText.transcriptAudio(audio);

    log(transcript.toString()); */
    
    final taskJson = await _googleGemini.getTaskStructured(
      content: 'Hatem, please send me the files; the required deadline is April 25, 2026',
    );

    return TaskCreateModel.fromJson(taskJson);
  }

  @override
  Future<void> saveTask(TaskCreateEntity newTask) async {
    await _supabase.from('table').insert({});
  }
}
