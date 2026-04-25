import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_members_model.freezed.dart';
part 'add_members_model.g.dart';

@freezed
abstract class AddMembersModel with _$AddMembersModel {
  const factory AddMembersModel({
    required String id,
    required String name,
    required String email,
  }) = _AddMembersModel;

  factory AddMembersModel.fromJson(Map<String, Object?> json) =>
      _$AddMembersModelFromJson(json);
}

extension AddMembersModelMapper on AddMembersModel {
  AddMembersEntity toEntity() {
    return AddMembersEntity(
      id: id,
      name: name,
      email: email,
    );
  }
}