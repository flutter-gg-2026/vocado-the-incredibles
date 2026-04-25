import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/view_members/domain/entities/view_members_entity.dart';
import 'package:vocado/features/view_members/domain/repositories/view_members_repository_domain.dart';

@lazySingleton
class ViewMembersUseCase {
  final ViewMembersRepositoryDomain _repositoryData;

  ViewMembersUseCase(this._repositoryData);

  Future<Result<List<ViewMembersEntity>, Failure>> getViewMembers() async {
    return _repositoryData.getViewMembers();
  }
}