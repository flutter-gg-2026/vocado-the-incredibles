import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/add_members/data/models/add_members_model.dart';

abstract class BaseAddMembersRemoteDataSource {
  Future<List<AddMembersModel>> getAddMembers();

  Future<void> createGroupMembers(List<String> userIds);

  Future<List<Map<String, dynamic>>> getMembersList();

  Future<void> updateGroupMember({
    required String memberRowId,
    required DateTime dueDate,
  });
}

@LazySingleton(as: BaseAddMembersRemoteDataSource)
class AddMembersRemoteDataSource implements BaseAddMembersRemoteDataSource {
  final SupabaseClient _supabase;

  AddMembersRemoteDataSource(this._supabase);

  @override
  Future<List<AddMembersModel>> getAddMembers() async {
    try {
      final response = await _supabase.from('users').select();


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

    final data = userIds.map((userId) {
      return {
        'user_id': userId,
        'admin_id': adminId,
        'group_create_date': DateTime.now().toIso8601String(),
      };
    }).toList();

    await _supabase.from('members').insert(data);
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}
  @override
  Future<List<Map<String, dynamic>>> getMembersList() async {
    try {
      final response = await _supabase
          .from('members')
          .select('id, user_id, admin_id, due_date');


      return List<Map<String, dynamic>>.from(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateGroupMember({
    required String memberRowId,
    required DateTime dueDate,
  }) async {
    try {
      await _supabase
          .from('members')
          .update({'due_date': dueDate.toIso8601String()})
          .eq('id', memberRowId)
          .select();

   
    } catch (error) {
     
      throw FailureExceptions.getException(error);
    }
  }
}
