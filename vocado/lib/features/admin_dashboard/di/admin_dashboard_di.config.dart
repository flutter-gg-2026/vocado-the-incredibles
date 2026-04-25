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
import 'package:vocado/features/admin_dashboard/data/datasources/admin_dashboard_remote_data_source.dart'
    as _i402;
import 'package:vocado/features/admin_dashboard/data/repositories/admin_dashboard_repository_data.dart'
    as _i1018;
import 'package:vocado/features/admin_dashboard/domain/repositories/admin_dashboard_repository_domain.dart'
    as _i236;
import 'package:vocado/features/admin_dashboard/domain/use_cases/admin_dashboard_use_case.dart'
    as _i272;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAdminDashboard({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i402.BaseAdminDashboardRemoteDataSource>(
      () => _i402.AdminDashboardRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i236.AdminDashboardRepositoryDomain>(
      () => _i1018.AdminDashboardRepositoryData(
        gh<_i402.BaseAdminDashboardRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i272.AdminDashboardUseCase>(
      () => _i272.AdminDashboardUseCase(
        gh<_i236.AdminDashboardRepositoryDomain>(),
      ),
    );
    return this;
  }
}
