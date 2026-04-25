import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/add_members/data/datasources/add_members_remote_data_source.dart';
import 'package:vocado/features/add_members/data/models/add_members_model.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/domain/repositories/add_members_repository_domain.dart';

@LazySingleton(as: AddMembersRepositoryDomain)
class AddMembersRepository implements AddMembersRepositoryDomain {
  final BaseAddMembersRemoteDataSource _remoteDataSource;

  AddMembersRepository(this._remoteDataSource);
  @override
  Future<Result<List<AddMembersEntity>, Failure>> getAddMembers() async {
    try {
      final result = await _remoteDataSource.getAddMembers();

      final entities = result.map((e) => e.toEntity()).toList();

      return Success(entities);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
Future<Result<void, Failure>> createGroupMembers(List<String> userIds) async {
  try {
    await _remoteDataSource.createGroupMembers(userIds);
    return const Success(null);
  } catch (error) {
    return Error(FailureExceptions.getException(error));
  }
}
  
}
