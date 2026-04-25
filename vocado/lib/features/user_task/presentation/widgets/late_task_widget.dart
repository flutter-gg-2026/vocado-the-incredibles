import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';

class LateTaskCard extends StatelessWidget {
  final UserTaskEntity task;

  const LateTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffEAF0FF),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Late",
            style: TextStyle(
              color: Color(0xffFF4D5A),
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap(14),
          Text(
            task.title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff102A63),
              fontSize: 18,
              height: 1.15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.flag, color: Colors.red, size: 22),
              const Gap(8),
              Expanded(
                child: Text(
                  task.dueDate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff102A63),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          const Icon(
            Icons.check_box_outline_blank_rounded,
            color: Color(0xff102A63),
            size: 24,
          ),
        ],
      ),
    );
  }
}