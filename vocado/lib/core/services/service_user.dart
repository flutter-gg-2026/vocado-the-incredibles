import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';
import 'package:vocado/core/common/models/auth_model.dart';

@lazySingleton
class ServiceUser {
  final SupabaseClient _supabase;

  AuthEntity? _currentUser;

  ServiceUser(this._supabase);

  AuthEntity? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;
  bool get isAdmin => _currentUser?.role.name == 'admin';
  bool get isUser => _currentUser?.role.name == 'user';


  Future<void> loadSession() async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      _currentUser = null;
      return;
    }

    final response = await _supabase
        .from('users')
        .select()
        .eq('id', user.id)
        .single();

    _currentUser = AuthModel.fromJson(response).toEntity();
  }


  void setUser(AuthEntity user) {
    _currentUser = user;
  }


  Future<void> signOut() async {
    await _supabase.auth.signOut();
    _currentUser = null;
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

}