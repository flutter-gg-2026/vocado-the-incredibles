import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';
import 'package:vocado/core/common/models/auth_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> logOut() async {
    try {
      final response = await remoteDataSource.logOut();
      return Success(response);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  @override
  Future<Result<AuthEntity, Failure>> logIn(
    String email,
    String password,
  ) async {
    try {
      final user = await remoteDataSource.logIn(email, password);
      final entity = user.toEntity();
      return Success(entity);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<AuthEntity, Failure>> signUp(
    String email,
    String password,
    String role,
    String name,
  ) async {
    try {
      final userModel = await remoteDataSource.signUp(
        email,
        password,
        role,
        name,
      );

      final entity = userModel.toEntity();
      return Success(entity);
    } catch (error) {

      return Error(FailureExceptions.getException(error));
    }
  }
}
