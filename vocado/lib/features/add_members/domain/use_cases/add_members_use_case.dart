import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/domain/repositories/add_members_repository_domain.dart';

@lazySingleton
class AddMembersUseCase {
  final AddMembersRepositoryDomain _repositoryData;

  AddMembersUseCase(this._repositoryData);

  Future<Result<List<AddMembersEntity>, Failure>> getAddMembers() {
    return _repositoryData.getAddMembers();
  }

  Future<Result<void, Failure>> createGroupMembers(List<String> userIds) {
    return _repositoryData.createGroupMembers(userIds);
  }
}