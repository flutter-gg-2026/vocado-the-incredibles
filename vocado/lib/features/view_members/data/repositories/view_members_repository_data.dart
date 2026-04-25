
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/view_members/domain/entities/view_members_entity.dart';

import 'package:vocado/features/view_members/data/datasources/view_members_remote_data_source.dart';
import 'package:vocado/features/view_members/data/models/view_members_model.dart';
import 'package:vocado/features/view_members/domain/repositories/view_members_repository_domain.dart';
@LazySingleton(as: ViewMembersRepositoryDomain)
class ViewMembersRepositoryData implements ViewMembersRepositoryDomain {
  final BaseViewMembersRemoteDataSource remoteDataSource;

  ViewMembersRepositoryData(this.remoteDataSource);

  @override
Future<Result<List<ViewMembersEntity>, Failure>> getViewMembers() async {
  try {
    final response = await remoteDataSource.getViewMembers();

    final entities = response.map((e) => e.toEntity()).toList();

    return Success(entities);
  } catch (error) {
    return Error(FailureExceptions.getException(error));
  }
}
  }
