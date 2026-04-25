import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/models/auth_model.dart';
import 'package:vocado/core/services/serviceUser.dart';

abstract class BaseAuthRemoteDataSource {

  Future<AuthModel> logIn(String email, String password);
  Future<AuthModel> signUp(
    String email,
    String password,
    String role,
    String name,
  );
  Future<Map<String, dynamic>> getCurrentUser(String userId);
  Future<void> logOut();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  final ServiceUser service;
  AuthRemoteDataSource(this.service, this._supabase);

  @override
  Future<Map<String, dynamic>> getCurrentUser(String userId) async {
    try {
      final currentUser = _supabase.auth.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final response = await _supabase
          .from('users')
          .select()
          .eq('id', userId)
          .single();

      return response;
    } catch (error) {
      print(error.toString());
      return {};
    }
  }

  @override
  Future<AuthModel> logIn(String email, String password) async {
    try {
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
      return AuthModel.fromJson(profile);
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<AuthModel> signUp(
    String email,
    String password,
    String role,
    String name,
  ) async {
    try {
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

      return AuthModel.fromJson(inserted);
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }
}
