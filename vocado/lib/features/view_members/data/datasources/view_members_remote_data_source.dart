import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/view_members/data/models/view_members_model.dart';

abstract class BaseViewMembersRemoteDataSource {
  Future<List<ViewMembersModel>> getViewMembers();
}

@LazySingleton(as: BaseViewMembersRemoteDataSource)
class ViewMembersRemoteDataSource implements BaseViewMembersRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ViewMembersRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<ViewMembersModel>> getViewMembers() async {
    try {
      final response = await _supabase.from('members').select('''
      id,
      due_date,
      user:users!members_user_id_fkey(
        id,
        name,
        email,
        role
      )
    ''');

      print('VIEW MEMBERS RESPONSE: $response');

      return response
          .map<ViewMembersModel>((json) => ViewMembersModel.fromJson(json))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
