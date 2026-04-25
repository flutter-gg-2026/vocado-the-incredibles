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
import 'package:vocado/core/services/service_user.dart' as _i124;
import 'package:vocado/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i489;
import 'package:vocado/features/profile/data/repositories/profile_repository_data.dart'
    as _i707;
import 'package:vocado/features/profile/domain/repositories/profile_repository_domain.dart'
    as _i671;
import 'package:vocado/features/profile/domain/use_cases/profile_use_case.dart'
    as _i573;
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart'
    as _i89;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i489.BaseProfileRemoteDataSource>(
      () => _i489.ProfileRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i671.ProfileRepositoryDomain>(
      () =>
          _i707.ProfileRepositoryData(gh<_i489.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i573.ProfileUseCase>(
      () => _i573.ProfileUseCase(gh<_i671.ProfileRepositoryDomain>()),
    );
    gh.factory<_i89.ProfileCubit>(
      () => _i89.ProfileCubit(
        gh<_i573.ProfileUseCase>(),
        gh<_i124.ServiceUser>(),
      ),
    );
    return this;
  }
}
