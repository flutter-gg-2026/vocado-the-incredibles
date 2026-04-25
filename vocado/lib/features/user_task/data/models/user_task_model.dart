import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

part 'user_task_model.freezed.dart';
part 'user_task_model.g.dart';

@freezed
abstract class UserTaskModel with _$UserTaskModel {
   const factory UserTaskModel({
    required String id,

    @JsonKey(name: 'task') required String title,

    @JsonKey(name: 'completed') required bool status,

    @JsonKey(name: 'due_date') required DateTime dueDate,

    required String name, 
   }) = _UserTaskModel;

  factory UserTaskModel.fromJson(Map<String, Object?> json) =>
      _$UserTaskModelFromJson(json);
}

extension UserTaskModelMapper on UserTaskModel {
  UserTaskEntity toEntity() {
    return UserTaskEntity(
      id: id,
      title: title,
      status: status == true ? 'Completed' : 'Pending',
      dueDate: dueDate.toString(),
         name: name,
    );
  }
}


  