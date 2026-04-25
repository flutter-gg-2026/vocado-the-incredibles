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
import 'package:vocado/features/user_task/data/datasources/user_task_remote_data_source.dart'
    as _i818;
import 'package:vocado/features/user_task/data/repositories/user_task_repository_data.dart'
    as _i692;
import 'package:vocado/features/user_task/domain/repositories/user_task_repository_domain.dart'
    as _i71;
import 'package:vocado/features/user_task/domain/use_cases/user_task_use_case.dart'
    as _i150;
import 'package:vocado/features/user_task/presentation/cubit/user_task_cubit.dart'
    as _i388;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUserTask({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i818.BaseUserTaskRemoteDataSource>(
      () => _i818.UserTaskRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i71.UserTaskRepositoryDomain>(
      () => _i692.UserTaskRepository(gh<_i818.BaseUserTaskRemoteDataSource>()),
    );
    gh.lazySingleton<_i150.UserTaskUseCase>(
      () => _i150.UserTaskUseCase(gh<_i71.UserTaskRepositoryDomain>()),
    );
    gh.factory<_i388.UserTaskCubit>(
      () => _i388.UserTaskCubit(gh<_i150.UserTaskUseCase>()),
    );
    return this;
  }
}
