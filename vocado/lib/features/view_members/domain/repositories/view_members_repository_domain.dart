import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/view_members/domain/entities/view_members_entity.dart';

abstract class ViewMembersRepositoryDomain {
Future<Result<List<ViewMembersEntity>, Failure>> getViewMembers();
}
