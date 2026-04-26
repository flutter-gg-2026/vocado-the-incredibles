import 'package:flutter/material.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:vocado/features/admin_dashboard/presentation/widgets/confirm_delete_widget.dart';

class TaskCardWidget extends StatelessWidget {
  final AdminDashboardEntity task;
  final Function()? onDelete;
  const TaskCardWidget({super.key, required this.task, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Task: ${task.task}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Icon(
                        task.completed
                            ? Icons.done
                            : Icons.incomplete_circle_outlined,
                        color: task.completed
                            ? Colors.green
                            : Colors.orangeAccent,
                      ),
                      IconButton(
                        style: ButtonStyle(tapTargetSize: .shrinkWrap),
                        onPressed: () async =>
                            await showDialog(
                              context: context,
                              builder: (context) => ConfirmDeleteWidget(),
                            ).then(
                              (value) => value == true && onDelete != null
                                  ? onDelete!()
                                  : null,
                            ),
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                      ),
                    ],
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
