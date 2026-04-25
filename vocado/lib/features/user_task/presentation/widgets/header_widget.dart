import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.menu_rounded,
            color: Color(0xff102A63),
            size: 30,
          ),
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: const Color(0xffEAF0FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xff1E4FD8),
          ),
        ),
      ],
    );
  }
}
