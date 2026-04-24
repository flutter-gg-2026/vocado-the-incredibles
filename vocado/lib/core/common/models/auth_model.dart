import 'package:vocado/core/common/entities/auth_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required int id,
    required String name,
    required String email,
    required String role,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);
}



extension AuthModelMapper on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(id: id, name: name, email: email, role: _mapRole(role));
  }
  }


UserRole _mapRole(String role) {
  switch (role) {
    case 'admin':
      return UserRole.admin;
    case 'user':
    default:
      return UserRole.user;
  }
}