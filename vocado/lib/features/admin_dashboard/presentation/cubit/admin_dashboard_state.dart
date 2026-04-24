import 'package:equatable/equatable.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';

abstract class AdminDashboardState extends Equatable {
  const AdminDashboardState();

  @override
  List<Object?> get props => [];
}

class AdminDashboardInitialState extends AdminDashboardState {}

class AdminDashboardSuccessState extends AdminDashboardState {
  final List<AdminDashboardEntity> tasks;

  const AdminDashboardSuccessState({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class AdminDashboardErrorState extends AdminDashboardState {
  final String message;
  const AdminDashboardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
