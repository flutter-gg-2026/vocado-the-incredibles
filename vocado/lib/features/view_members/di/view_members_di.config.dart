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
import 'package:vocado/features/view_members/data/datasources/view_members_remote_data_source.dart'
    as _i359;
import 'package:vocado/features/view_members/data/repositories/view_members_repository_data.dart'
    as _i210;
import 'package:vocado/features/view_members/domain/repositories/view_members_repository_domain.dart'
    as _i368;
import 'package:vocado/features/view_members/domain/use_cases/view_members_use_case.dart'
    as _i264;
import 'package:vocado/features/view_members/presentation/cubit/view_members_cubit.dart'
    as _i1000;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewMembers({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i359.BaseViewMembersRemoteDataSource>(
      () => _i359.ViewMembersRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i368.ViewMembersRepositoryDomain>(
      () => _i210.ViewMembersRepositoryData(
        gh<_i359.BaseViewMembersRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i264.ViewMembersUseCase>(
      () => _i264.ViewMembersUseCase(gh<_i368.ViewMembersRepositoryDomain>()),
    );
    gh.factory<_i1000.ViewMembersCubit>(
      () => _i1000.ViewMembersCubit(gh<_i264.ViewMembersUseCase>()),
    );
    return this;
  }
}
