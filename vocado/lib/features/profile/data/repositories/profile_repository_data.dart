import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/profile/domain/entities/profile_entity.dart';
import 'package:vocado/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:vocado/features/profile/data/models/profile_model.dart';
import 'package:vocado/features/profile/domain/repositories/profile_repository_domain.dart';

@LazySingleton(as: ProfileRepositoryDomain)
class ProfileRepositoryData implements ProfileRepositoryDomain{
  final BaseProfileRemoteDataSource remoteDataSource;


  ProfileRepositoryData(this.remoteDataSource);

@override
  Future<Result<ProfileEntity, Failure>> getProfile(String userId) async {
    try {
      final response = await remoteDataSource.getProfile(userId);
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<ProfileEntity, Failure>> updateProfile( String name,String userId) async {
    final response = await remoteDataSource.updateProfile( name, userId);
    try{
        return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
