import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';

class AddConfirmationWidget extends StatelessWidget {
  final TaskCreateEntity task;
  const AddConfirmationWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Task Confirmation'),
      content: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text('Task is:'),
          Text(task.task),
          Text('Assign to: ${task.assignee}'),
          Text('Due date: ${Formatters.formatDate(task.dueDate)}'),
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(foregroundColor: .all(Colors.redAccent)),
          child: const Text('Cancel'),
          onPressed: () {
            context.pop(false);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            context.pop(true);
          },
        ),
      ],
    );
  }
}
