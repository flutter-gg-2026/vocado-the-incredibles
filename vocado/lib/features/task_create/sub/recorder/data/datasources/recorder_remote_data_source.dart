import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/services/record_service.dart';

abstract class BaseRecorderRemoteDataSource {
  Future<void> startRecording();
  Future<File> stopRecording();
}

@LazySingleton(as: BaseRecorderRemoteDataSource)
class RecorderRemoteDataSource implements BaseRecorderRemoteDataSource {
  final RecordService _recordService;

  RecorderRemoteDataSource(this._recordService);

  @override
  Future<void> startRecording() async {
    await _recordService.startRecording();
  }

  @override
  Future<File> stopRecording() async {
    final file = await _recordService.stopRecording();
    return file;
  }
}
