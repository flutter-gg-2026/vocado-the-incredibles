import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/entities/recorder_entity.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/repositories/recorder_repository_domain.dart';

@lazySingleton
class RecorderUseCase {
  final RecorderRepositoryDomain _repositoryData;

  RecorderUseCase(this._repositoryData);

  Future<Result<void, Failure>> startRecording() async {
    return _repositoryData.startRecording();
  }

  Future<Result<RecorderEntity, Failure>> stopRecording() {
    return _repositoryData.stopRecording();
  }
}
