import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.push(Routes.viewMembers);
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: const Color(0xffEAF0FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
         GestureDetector(
          onTap: () {
            context.push(Routes.auth);
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: const Color(0xffEAF0FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.logout_rounded, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    );
  }
}
