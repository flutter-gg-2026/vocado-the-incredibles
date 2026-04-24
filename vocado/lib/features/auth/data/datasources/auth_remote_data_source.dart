import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/auth/data/models/auth_model.dart';

abstract class BaseAuthRemoteDataSource {
  // Future<AuthModel> getAuth();

  Future<AuthModel> logIn(String email, String password);
  Future<AuthModel> signUp(String email, String password, String role, String name);
  Future<Map<String, dynamic>> getCurrentUser(int userId);
  Future<void> logOut();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AuthRemoteDataSource(this._localKeysService, this._supabase);


@override
Future<Map<String, dynamic>> getCurrentUser(int userId) async {
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

    return AuthModel.fromJson(response).toJson();

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
      final profile = await _supabase.from('users').select().eq('id', userId).single();
       return AuthModel.fromJson(profile);
     
       
    } catch (error) {
      print(error.toString());
      throw error;
    //  FailureExceptions.getException(error);
    }
  }


  @override
Future<AuthModel> signUp(String email, String password, String role, String name) async {
  try {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      print('____________O1____________');
      throw Exception('User is null');
    }

    final inserted = await _supabase.from('users').insert({
      // 'id': user.id, 
      'email': email,
      'name': '',
      'role': role, 
    }).select().single();

    return AuthModel.fromJson(inserted);

  } catch (error) {
    print(error.toString());
    throw error; 
  }
}

  @override
  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }

  //   @override
  // Future<AuthModel> getAuth() async {
  //   try {
  //     return AuthModel(id: 1, firstName: "Last Name", lastName: "First Name");
  //   } catch (error) {
  //    throw FailureExceptions.getException(error);
  //   }
  // }
}
