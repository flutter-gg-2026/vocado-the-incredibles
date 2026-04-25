import 'package:vocado/features/profile/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String? name,
    required String email,
    required String role,
    
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) => _$ProfileModelFromJson(json);
}



extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(id: id, name: name, email: email, role: role);
  }
  }
