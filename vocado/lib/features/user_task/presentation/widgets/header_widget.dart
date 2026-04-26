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
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.surfaceContainer,
              boxShadow: kElevationToShadow[1],
            ),
            child: const Icon(Icons.group),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push(Routes.profile);
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
              boxShadow: kElevationToShadow[1],
            ),
            child: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
