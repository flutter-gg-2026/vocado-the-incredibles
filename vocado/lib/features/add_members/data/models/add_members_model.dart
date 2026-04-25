import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';

part 'add_members_model.freezed.dart';
part 'add_members_model.g.dart';

@freezed
abstract class AddMembersModel with _$AddMembersModel {
  const factory AddMembersModel({
    required String id,
    @Default('') String name,
    @Default('') String email,
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