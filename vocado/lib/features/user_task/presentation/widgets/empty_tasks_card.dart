import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyTasksCard extends StatelessWidget {
  final String text;

  const EmptyTasksCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260, // 👈 important for horizontal scroll
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 🟢 ICON
          const Icon(
            Icons.inbox,
            size: 40,
            color: Color(0xff2A58E8),
          ),

          const Gap(12),

          /// 🟢 TEXT
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff102A63),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}