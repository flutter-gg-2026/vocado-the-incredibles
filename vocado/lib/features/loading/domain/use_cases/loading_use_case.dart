import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/loading/domain/entities/loading_entity.dart';
import 'package:vocado/features/loading/domain/repositories/loading_repository_domain.dart';


@lazySingleton
class LoadingUseCase {
  final LoadingRepositoryDomain _repositoryData;

  LoadingUseCase(this._repositoryData);

   Future<Result<bool, Failure>> getLoading() async {
    return _repositoryData.getLoading();
  }
}
