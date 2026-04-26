import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/models/auth_model.dart';
import 'package:vocado/core/services/service_user.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> logIn(String email, String password);
  Future<AuthModel> signUp(
    String email,
    String password,
    String role,
    String name,
  );
  Future<void> logOut();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  final ServiceUser _serviceUser;
  AuthRemoteDataSource(this._serviceUser, this._supabase);

  @override
  Future<AuthModel> logIn(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
    final userId = response.user!.id;
    final profile = await _supabase
        .from('users')
        .select()
        .eq('id', userId)
        .single();
    _serviceUser.setUser(AuthModel.fromJson(profile).toEntity());
    return AuthModel.fromJson(profile);
  }

  @override
  Future<AuthModel> signUp(
    String email,
    String password,
    String role,
    String name,
  ) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': name.trim(), 'role': role},
    );

    final user = response.user;

    if (user == null) {
      throw Exception('User is null');
    }

    final inserted = await _supabase
        .from('users')
        .insert({'id': user.id, 'email': email, 'name': name, 'role': role})
        .select()
        .single();

    _serviceUser.setUser(AuthModel.fromJson(inserted).toEntity());
    return AuthModel.fromJson(inserted);
  }

  @override
  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }
}
