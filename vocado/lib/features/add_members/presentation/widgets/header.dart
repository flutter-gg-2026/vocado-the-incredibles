import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocado/features/add_members/presentation/widgets/icon_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconBox(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const Text(
          "Add Members",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xff24224A),
          ),
        ),
        const IconBox(icon: Icons.more_horiz_rounded),
      ],
    );
  }
}
