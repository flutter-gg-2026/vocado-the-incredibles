import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';

abstract class AuthRepositoryDomain {
    Future<Result<AuthEntity, Failure>> logIn(String email, String password);
    Future<Result<AuthEntity, Failure>> signUp (String email, String password, String role, String name);
    Future<Map<String, dynamic>> getCurrentUser(String userId);
    Future<Result<void, Failure>> logOut();
}
