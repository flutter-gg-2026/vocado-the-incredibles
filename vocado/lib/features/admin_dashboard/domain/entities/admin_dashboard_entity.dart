import 'package:equatable/equatable.dart';

class AdminDashboardEntity extends Equatable {
  final String id;
  final String task;
  final String assignee;
  final String assigneeId;
  final DateTime dueDate;
  final bool completed;

  const AdminDashboardEntity({
    required this.id,
    required this.task,
    required this.assignee,
    required this.assigneeId,
    required this.dueDate,
    required this.completed,
  });

  @override
  List<Object?> get props => [
    id,
    task,
    assignee,
    assigneeId,
    dueDate,
    completed,
  ];
}
