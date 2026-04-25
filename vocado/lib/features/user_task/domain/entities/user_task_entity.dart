import 'package:equatable/equatable.dart';

class UserTaskEntity extends Equatable {
  final String id;
  final String title;
  final String status;
  final String dueDate;

  const UserTaskEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.dueDate,
  });

  @override
  List<Object?> get props => [id, title, status, dueDate];
}