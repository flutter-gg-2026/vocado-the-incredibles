
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_add_alt_1_rounded,
              size: 42,
              color: Color(0xff3D35A6),
            ),
            SizedBox(height: 14),
            Text(
              "No logged in user found",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xff24224A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
