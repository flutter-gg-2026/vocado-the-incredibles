import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';


@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain repositoryData;

  AuthUseCase(this.repositoryData);

  //  Future<Result<AuthEntity, Failure>> getAuth() async {
  //   return _repositoryData.getAuth();
  // }

  Future<Result<AuthEntity, Failure>> logIn(String email, String password){
    return repositoryData.logIn(email, password);
  }

  Future<Result<AuthEntity, Failure>> signUp (String email, String password, String role, String name){
    return repositoryData.signUp(email, password, role, name);
  }

}
