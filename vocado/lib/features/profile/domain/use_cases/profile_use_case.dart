import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/profile/domain/entities/profile_entity.dart';
import 'package:vocado/features/profile/domain/repositories/profile_repository_domain.dart';


@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryDomain _repositoryData;

  ProfileUseCase(this._repositoryData);

  Future<Result<ProfileEntity, Failure>> getProfile(String userId) async {
    return _repositoryData.getProfile(userId);
  }

   Future<Result<ProfileEntity, Failure>> updateProfile(String name, String userId) async {
    return _repositoryData.updateProfile(name ,userId);
  }
}
