// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:vocado/core/services/local_keys_service.dart' as _i140;
import 'package:vocado/features/add_members/data/datasources/add_members_remote_data_source.dart'
    as _i504;
import 'package:vocado/features/add_members/data/repositories/add_members_repository_data.dart'
    as _i291;
import 'package:vocado/features/add_members/domain/repositories/add_members_repository_domain.dart'
    as _i182;
import 'package:vocado/features/add_members/domain/use_cases/add_members_use_case.dart'
    as _i621;
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart'
    as _i735;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddMembers({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i504.BaseAddMembersRemoteDataSource>(
      () => _i504.AddMembersRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i182.AddMembersRepositoryDomain>(
      () => _i291.AddMembersRepository(
        gh<_i504.BaseAddMembersRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i621.AddMembersUseCase>(
      () => _i621.AddMembersUseCase(gh<_i182.AddMembersRepositoryDomain>()),
    );
    gh.factory<_i735.AddMembersCubit>(
      () => _i735.AddMembersCubit(gh<_i621.AddMembersUseCase>()),
    );
    return this;
  }
}
