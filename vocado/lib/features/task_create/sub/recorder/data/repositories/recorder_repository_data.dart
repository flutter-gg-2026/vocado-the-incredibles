import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/entities/recorder_entity.dart';

import 'package:vocado/features/task_create/sub/recorder/data/datasources/recorder_remote_data_source.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/repositories/recorder_repository_domain.dart';

@LazySingleton(as: RecorderRepositoryDomain)
class RecorderRepositoryData implements RecorderRepositoryDomain {
  final BaseRecorderRemoteDataSource remoteDataSource;

  RecorderRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> startRecording() async {
    try {
      await remoteDataSource.startRecording();
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<RecorderEntity, Failure>> stopRecording() async {
    try {
      final record = await remoteDataSource.stopRecording();
      final dividedPath = record.path.split('/');
      return Success(
        RecorderEntity(
          name: dividedPath.last,
          extension: dividedPath.last.split('.').last,
          path: record,
        ),
      );
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
