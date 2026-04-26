import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/task_create/domain/entities/task_create_entity.dart';
import 'package:vocado/features/task_create/presentation/widgets/custom_text_field.dart';

class AddConfirmationWidget extends HookWidget {
  final TaskCreateEntity task;
  const AddConfirmationWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskController = useTextEditingController()..text = task.task;
    final nameController = useTextEditingController()..text = task.assignee;
    final dateController = useTextEditingController()
      ..text = Formatters.formatDate(task.dueDate);
    final keyField = GlobalKey<FormState>();

    return AlertDialog(
      scrollable: true,
      title: Text('Task Confirmation'),
      content: SingleChildScrollView(
        child: Form(
          key: keyField,
          child: Column(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              Text(
                'You can edit task and name if needed, (Make sure name is already added to your team)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomTextField(controller: taskController, label: 'Task is:'),
              CustomTextField(controller: nameController, label: 'Assign to:'),
              CustomTextField(
                controller: dateController,
                label: 'Due date:',
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(foregroundColor: .all(Colors.redAccent)),
          child: const Text('Cancel'),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            if (keyField.currentState!.validate()) {
              final newTask = TaskCreateEntity(
                task: taskController.text,
                assignee: nameController.text,
                dueDate: DateTime.tryParse(dateController.text) ?? task.dueDate,
              );
              context.pop(task == newTask ? task : newTask);
            }
          },
        ),
      ],
    );
  }
}
