import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyTasksCard extends StatelessWidget {
  final String text;

  const EmptyTasksCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xff102A63),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
