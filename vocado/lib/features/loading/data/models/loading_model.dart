import 'package:vocado/features/loading/domain/entities/loading_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'loading_model.freezed.dart';
part 'loading_model.g.dart';

@freezed
abstract class LoadingModel with _$LoadingModel {
  const factory LoadingModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _LoadingModel;

  factory LoadingModel.fromJson(Map<String, Object?> json) => _$LoadingModelFromJson(json);
}



extension LoadingModelMapper on LoadingModel {
  LoadingEntity toEntity() {
    return LoadingEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
