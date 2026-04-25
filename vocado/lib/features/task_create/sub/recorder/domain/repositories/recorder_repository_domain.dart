import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/entities/recorder_entity.dart';

abstract class RecorderRepositoryDomain {
    Future<Result<void, Failure>> startRecording();

    Future<Result<RecorderEntity, Failure>> stopRecording();
}
