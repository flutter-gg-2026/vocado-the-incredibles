import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

class ProgressTaskTile extends StatelessWidget {
  final UserTaskEntity task;

  const ProgressTaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xffE8F8FA),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              task.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff102A63),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}