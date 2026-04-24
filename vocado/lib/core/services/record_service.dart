import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:vocado/core/errors/failure.dart';

@lazySingleton
class RecordService {
  final record = AudioRecorder();
  final player = AudioPlayer();

  Future<void> startRecording() async {
    if (!await record.hasPermission()) {
      throw PermissionFailure();
    }
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    await record.start(
      RecordConfig(),
      path: '${appDocumentsDir.path}/taskAudio.m4a',
    );
    log('Recording Started');
  }

  Future<File> stopRecording() async {
    if (!await record.isRecording()) {
      throw Exception('No Voice is bering recorded');
    }
    final path = await record.stop();
    log('Recording Stopped');

    if ((await player.setFilePath(path!))!.inMilliseconds < 1500) {
      throw Exception('Audio duration is less than 2 seconds');
    }
    return File(path);
  }
}
