import 'package:equatable/equatable.dart';

class AdminDashboardEntity extends Equatable {
  final String id;
  final String task;
  final String assignee;
  final String assigneeId;
  final DateTime dueDate;
  final DateTime createdAt;
  final bool completed;

  const AdminDashboardEntity({
    required this.id,
    required this.task,
    required this.assignee,
    required this.assigneeId,
    required this.dueDate,
    required this.completed,
    required this.createdAt,
  });

  AdminDashboardEntity copyWith({
    String? id,
    String? task,
    String? assignee,
    String? assigneeId,
    DateTime? dueDate,
    DateTime? createdAt,
    bool? completed,
  }) {
    return AdminDashboardEntity(
      id: id ?? this.id,
      task: task ?? this.task,
      assignee: assignee ?? this.assignee,
      assigneeId: assigneeId ?? this.assigneeId,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
