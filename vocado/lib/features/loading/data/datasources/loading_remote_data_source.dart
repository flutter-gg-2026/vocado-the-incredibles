import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/service_user.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<bool> getLoading();
}


@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
 
  final SupabaseClient _supabase;
  final ServiceUser _userService;
  
   LoadingRemoteDataSource(this._userService, this._supabase);

    @override
  Future<bool> getLoading() async {
    final userSession = _supabase.auth.currentSession;

    final isLogged = userSession?.accessToken != null;
    final sessionExpired = userSession?.isExpired ?? true;

    if (!isLogged || sessionExpired) {
      return false;
    }
    await _userService.currentUser;
    return true;
  }
}
