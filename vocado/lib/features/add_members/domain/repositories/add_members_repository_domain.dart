import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';

abstract class AddMembersRepositoryDomain {
  Future<Result<List<AddMembersEntity>, Failure>> getAddMembers();

  Future<Result<void, Failure>> createGroupMembers(List<String> userIds);

  Future<Result<List<Map<String, dynamic>>, Failure>> getMembersList();

  Future<Result<void, Failure>> updateGroupMember({
    required String memberRowId,
    required DateTime dueDate,
  });
}