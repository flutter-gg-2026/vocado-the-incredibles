import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/service_user.dart';
import 'package:vocado/features/profile/data/models/profile_model.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);
  Future<ProfileModel> updateProfile(String name, String userId);
  Future<void> signOUt();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;
  final ServiceUser _serviceUser;

  ProfileRemoteDataSource(this._supabase, this._serviceUser);

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
  Future<ProfileModel> updateProfile(String name, String userId) async {
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

  @override
  Future<void> signOUt() async {
   await _serviceUser.signOut();
  }
}
