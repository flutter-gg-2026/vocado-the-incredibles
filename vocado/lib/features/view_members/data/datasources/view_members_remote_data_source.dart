import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/view_members/data/models/view_members_model.dart';

abstract class BaseViewMembersRemoteDataSource {
  Future<List<ViewMembersModel>> getViewMembers();
}

@LazySingleton(as: BaseViewMembersRemoteDataSource)
class ViewMembersRemoteDataSource implements BaseViewMembersRemoteDataSource {
  final SupabaseClient _supabase;

  ViewMembersRemoteDataSource(this._supabase);

  @override
  Future<List<ViewMembersModel>> getViewMembers() async {
    try {
      final adminId = _supabase.auth.currentUser?.id;

      if (adminId == null) {
        return [];
      }

      final response = await _supabase
          .from('members')
          .select('''
      id,
      user:users!members_user_id_fkey(
        id,
        name,
        email,
        role
      )
    ''')
          .eq('admin_id', adminId);

      return response
          .map<ViewMembersModel>((json) => ViewMembersModel.fromJson(json))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
