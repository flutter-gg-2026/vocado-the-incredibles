import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

class AllTasksScreen extends StatelessWidget {
  final String title;
  final List<UserTaskEntity> tasks;

  const AllTasksScreen({
    super.key,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.dueDate),
          );
        },
      ),
    );
  }
}
