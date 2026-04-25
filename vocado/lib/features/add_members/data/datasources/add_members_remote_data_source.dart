import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/add_members/data/models/add_members_model.dart';

abstract class BaseAddMembersRemoteDataSource {
  Future<List<AddMembersModel>> getAddMembers();
  Future<void> createGroupMembers(List<String> userIds);
}

@LazySingleton(as: BaseAddMembersRemoteDataSource)
class AddMembersRemoteDataSource implements BaseAddMembersRemoteDataSource {
  final LocalKeysService _localKeysService;
  final SupabaseClient _supabase;

  AddMembersRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<AddMembersModel>> getAddMembers() async {
    try {
      final response = await _supabase.from('users').select();

      print('USERS RESPONSE: $response');

      return response.map((json) => AddMembersModel.fromJson(json)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> createGroupMembers(List<String> userIds) async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        throw Exception('No logged in user');
      }

      final adminId = user.id; 

      if (adminId.isEmpty || adminId == 'user_id') {
        throw Exception('adminId is not valid UUID: $adminId');
      }

      final data = userIds.map((userId) {
        return {
          'user_id': userId,
          'admin_id': adminId,
          'due_date': DateTime.now().toIso8601String(),
        };
      }).toList();

      print('INSERT DATA: $data');

      final response = await _supabase.from('members').insert(data).select();

      print('INSERT RESPONSE: $response');
    } catch (error) {
      print('INSERT ERROR: $error');
      throw FailureExceptions.getException(error);
    }
  }
}
