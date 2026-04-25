// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoadingModel _$LoadingModelFromJson(Map<String, dynamic> json) =>
    _LoadingModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$LoadingModelToJson(_LoadingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
