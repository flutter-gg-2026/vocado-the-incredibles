import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/loading/domain/entities/loading_entity.dart';

abstract class LoadingRepositoryDomain {
    Future<Result<bool, Failure>> getLoading();
}
