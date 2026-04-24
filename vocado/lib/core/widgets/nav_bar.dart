import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).scaffoldBackgroundColor,
          items: [Icon(Icons.home, size: 30), Icon(Icons.dashboard, size: 30)],
          onTap: (index) {
            navigationShell.goBranch(index);
          },
        ),
      ),
      body: navigationShell,
    );
  }
}
