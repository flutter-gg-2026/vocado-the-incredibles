import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/profile/data/models/profile_model.dart';


abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);
  Future<ProfileModel> updateProfile(String name ,String userId);
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ProfileRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final response = await _supabase
        .from('users')
        .select()
        .eq('id', userId)
        .single();

    return ProfileModel(
      id: response['id'],
      name: response['name'],
      email: response['email'],
      role: response['role'],
    );
  }

  @override
  Future<ProfileModel> updateProfile(String name ,String userId) async {
  final userId = _supabase.auth.currentUser!.id;

  final response = await _supabase
      .from('users')
      .update({'name': name})
      .eq('id', userId)
      .select()
      .single();

  return ProfileModel(
    id: response['id'],
    name: response['name'],
    email: response['email'],
    role: response['role'],
  );
}

}
