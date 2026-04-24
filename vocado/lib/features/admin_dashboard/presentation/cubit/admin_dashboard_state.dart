import 'package:equatable/equatable.dart';

abstract class AdminDashboardState extends Equatable {
  const AdminDashboardState();

  @override
  List<Object?> get props => [];
}

class AdminDashboardInitialState extends AdminDashboardState {}
class AdminDashboardSuccessState extends AdminDashboardState {}

class AdminDashboardErrorState extends AdminDashboardState {
  final String message;
  const AdminDashboardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

