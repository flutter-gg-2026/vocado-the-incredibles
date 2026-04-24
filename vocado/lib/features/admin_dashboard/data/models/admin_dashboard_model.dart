import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_dashboard_model.freezed.dart';
part 'admin_dashboard_model.g.dart';

@freezed
abstract class AdminDashboardModel with _$AdminDashboardModel {
  const factory AdminDashboardModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AdminDashboardModel;

  factory AdminDashboardModel.fromJson(Map<String, Object?> json) => _$AdminDashboardModelFromJson(json);
}



extension AdminDashboardModelMapper on AdminDashboardModel {
  AdminDashboardEntity toEntity() {
    return AdminDashboardEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
