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
                    'Task: ${task.task}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisSize: .min,
                    spacing: 5,
                    children: [
                      Icon(Icons.watch_later, size: 20),
                      Text(
                        Formatters.formatDate(task.dueDate),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: .min,
                    spacing: 5,
                    children: [
                      Icon(Icons.person_outline, size: 20),
                      Expanded(
                        child: Text(
                          task.assignee,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Text(
                        'Assigned at: ${Formatters.formatDateTime(task.createdAt)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
