
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/loading/domain/entities/loading_entity.dart';

import 'package:vocado/features/loading/data/datasources/loading_remote_data_source.dart';
import 'package:vocado/features/loading/data/models/loading_model.dart';
import 'package:vocado/features/loading/domain/repositories/loading_repository_domain.dart';

@LazySingleton(as: LoadingRepositoryDomain)
class LoadingRepositoryData implements LoadingRepositoryDomain{
  final BaseLoadingRemoteDataSource remoteDataSource;


  LoadingRepositoryData(this.remoteDataSource);

@override
  Future<Result<bool, Failure>> getLoading() async {
    try {
      final response = await remoteDataSource.getLoading();
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
