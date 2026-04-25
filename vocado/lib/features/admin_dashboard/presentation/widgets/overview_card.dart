import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final String? title;
  final String? number;
  final IconData? icon;
  final Color? color;
  const OverviewCard({super.key, this.title, this.number, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  title ?? 'Title',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Icon(icon),
              ],
            ),
            Row(children: [Text(number ?? '0')]),
          ],
        ),
      ),
    );
  }
}
