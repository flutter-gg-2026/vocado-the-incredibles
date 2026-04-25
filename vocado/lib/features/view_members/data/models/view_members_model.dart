import 'package:vocado/features/view_members/domain/entities/view_members_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_members_model.freezed.dart';
part 'view_members_model.g.dart';

@freezed
abstract class ViewMembersModel with _$ViewMembersModel {
  const factory ViewMembersModel({
    required String id,
    required String name,
    required String email,
    required String role,
  }) = _ViewMembersModel;

  factory ViewMembersModel.fromJson(Map<String, Object?> json) {
    final user = json['user'] as Map<String, dynamic>?;

    return ViewMembersModel(
      id: json['id']?.toString() ?? '',
      name: user?['name']?.toString() ?? 'No name',
      email: user?['email']?.toString() ?? 'No email',
      role: user?['role']?.toString() ?? 'No role',
    );
  }
}

extension ViewMembersModelMapper on ViewMembersModel {
  ViewMembersEntity toEntity() {
    return ViewMembersEntity(
      id: id,
      name: name,
      email: email,
      role: role,
    );
  }
}