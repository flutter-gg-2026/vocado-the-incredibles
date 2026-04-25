import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/add_members/data/models/add_members_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseAddMembersRemoteDataSource {
  Future<List<AddMembersModel>> getAddMembers();
    Future<void> createGroupMembers(List<String> userIds);
}

@LazySingleton(as: BaseAddMembersRemoteDataSource)
class AddMembersRemoteDataSource implements BaseAddMembersRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AddMembersRemoteDataSource(this._localKeysService, this._supabase);

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
    final adminId = _supabase.auth.currentUser?.id;

    if (adminId == null) {
      throw Exception('No logged in admin found');
    }

    final data = userIds.map((userId) {
      return {
        'user_id': userId,
        'admin_id': adminId,
        'due_date': DateTime.now().toIso8601String(),
      };
    }).toList();

    print('INSERT DATA: $data');

    final response = await _supabase
        .from('members')
        .insert(data)
        .select();

    print('INSERT RESPONSE: $response');
  } catch (error) {
    print('INSERT ERROR: $error');
    throw FailureExceptions.getException(error);
  }
}
}
