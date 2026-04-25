import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int? count;
  final Color? countColor;
  final Color countTextColor;


  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.count,
    this.countColor,
    this.countTextColor = Colors.white,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Color(0xff102A63),
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            children: [
              if (subtitle != null)
                TextSpan(
                  text: " $subtitle",
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
            ],
          ),
        ),
        if (count != null) ...[
          const Gap(10),
          CircleAvatar(
            radius: 18,
            backgroundColor: countColor,
            child: Text(
              count!.toString(),
              style: TextStyle(
                color: countTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
        const Spacer(),
       
  
        
      ],
    );
  }
}
