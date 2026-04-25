// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_members_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddMembersModel _$AddMembersModelFromJson(Map<String, dynamic> json) =>
    _AddMembersModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$AddMembersModelToJson(_AddMembersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
