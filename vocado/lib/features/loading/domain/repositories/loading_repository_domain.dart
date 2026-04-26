import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class LoadingRepositoryDomain {
    Future<Result<AuthEntity, Failure>> getLoading();
}
