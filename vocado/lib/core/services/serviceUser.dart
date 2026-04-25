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
        .eq('auth_id', user.id)
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

}