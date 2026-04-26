import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmDeleteWidget extends StatelessWidget {
  const ConfirmDeleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Task Delete'),
      content: Text(
        "You're about to delete the task for the member.\nDo you want to confirm ?",
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
