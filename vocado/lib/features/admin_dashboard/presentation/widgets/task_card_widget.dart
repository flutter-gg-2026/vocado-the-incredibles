import 'package:flutter/material.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';

class TaskCardWidget extends StatelessWidget {
  final AdminDashboardEntity task;
  const TaskCardWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Task ${task.id.substring(task.id.lastIndexOf('-') + 1)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    task.task,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisSize: .min,
                    spacing: 5,
                    children: [
                      Icon(Icons.watch_later, size: 20),
                      Text(Formatters.formatDateTime(task.dueDate)),
                    ],
                  ),
                  Row(
                    mainAxisSize: .min,
                    spacing: 5,
                    children: [
                      Icon(Icons.person_outline, size: 20),
                      Text(task.assignee),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.minHeight,
                    child: Align(
                      alignment: .bottomEnd,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
