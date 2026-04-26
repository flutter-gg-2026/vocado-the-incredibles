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
import 'package:vocado/core/services/google_gemini.dart' as _i146;
import 'package:vocado/core/services/record_service.dart' as _i630;
import 'package:vocado/core/services/service_user.dart' as _i258;
import 'package:vocado/core/services/speech_to_text.dart' as _i311;
import 'package:vocado/features/task_create/data/datasources/task_create_remote_data_source.dart'
    as _i500;
import 'package:vocado/features/task_create/data/repositories/task_create_repository_data.dart'
    as _i759;
import 'package:vocado/features/task_create/domain/repositories/task_create_repository_domain.dart'
    as _i51;
import 'package:vocado/features/task_create/domain/use_cases/task_create_use_case.dart'
    as _i6;
import 'package:vocado/features/task_create/sub/recorder/data/datasources/recorder_remote_data_source.dart'
    as _i402;
import 'package:vocado/features/task_create/sub/recorder/data/repositories/recorder_repository_data.dart'
    as _i174;
import 'package:vocado/features/task_create/sub/recorder/domain/repositories/recorder_repository_domain.dart'
    as _i214;
import 'package:vocado/features/task_create/sub/recorder/domain/use_cases/recorder_use_case.dart'
    as _i187;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskCreate({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i500.BaseTaskCreateRemoteDataSource>(
      () => _i500.TaskCreateRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i146.GoogleGemini>(),
        gh<_i311.SpeechToText>(),
        gh<_i258.ServiceUser>(),
      ),
    );
    gh.lazySingleton<_i51.TaskCreateRepositoryDomain>(
      () => _i759.TaskCreateRepositoryData(
        gh<_i500.BaseTaskCreateRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i402.BaseRecorderRemoteDataSource>(
      () => _i402.RecorderRemoteDataSource(gh<_i630.RecordService>()),
    );
    gh.lazySingleton<_i6.TaskCreateUseCase>(
      () => _i6.TaskCreateUseCase(gh<_i51.TaskCreateRepositoryDomain>()),
    );
    gh.lazySingleton<_i214.RecorderRepositoryDomain>(
      () => _i174.RecorderRepositoryData(
        gh<_i402.BaseRecorderRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i187.RecorderUseCase>(
      () => _i187.RecorderUseCase(gh<_i214.RecorderRepositoryDomain>()),
    );
    return this;
  }
}
