// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../network/dio_client.dart' as _i667;
import '../services/google_gemini.dart' as _i416;
import '../services/local_keys_service.dart' as _i945;
import '../services/record_service.dart' as _i982;
import '../services/service_user.dart' as _i108;
import '../services/speech_to_text.dart' as _i242;
import 'third_part.dart' as _i423;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyConfig = _$ThirdPartyConfig();
    gh.factory<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i792.GetStorage>(() => thirdPartyConfig.storage);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => thirdPartyConfig.supabaseClient,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => thirdPartyConfig.flutterSecureStorage,
    );
    gh.lazySingleton<_i982.RecordService>(() => _i982.RecordService());
    gh.lazySingleton<_i108.ServiceUser>(
      () => _i108.ServiceUser(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i416.GoogleGemini>(
      () => _i416.GoogleGemini(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i242.SpeechToText>(
      () => _i242.SpeechToText(gh<_i667.DioClient>()),
    );
    gh.singleton<_i945.LocalKeysService>(() => _i945.LocalKeysService());
    return this;
  }
}

class _$ThirdPartyConfig extends _i423.ThirdPartyConfig {}
