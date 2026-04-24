import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_dashboard_model.freezed.dart';
part 'admin_dashboard_model.g.dart';

@freezed
abstract class AdminDashboardModel with _$AdminDashboardModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory AdminDashboardModel({
    required String id,
    required String task,
    String? assignee,
    required String assigneeId,
    required DateTime dueDate,
    required bool completed,
  }) = _AdminDashboardModel;

  factory AdminDashboardModel.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardModelFromJson(json);
}

extension AdminDashboardModelMapper on AdminDashboardModel {
  AdminDashboardEntity toEntity() {
    return AdminDashboardEntity(
      id: id,
      task: task,
      assignee: assignee ?? 'Hatem',
      assigneeId: assigneeId,
      dueDate: dueDate,
      completed: completed,
    );
  }
}
