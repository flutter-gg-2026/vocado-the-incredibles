import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          height: 50,
          index: navigationShell.currentIndex,
          backgroundColor: Colors.transparent,
          color: Theme.of(context).colorScheme.primary,
          buttonBackgroundColor: Theme.of(context).colorScheme.primary,
          items: [
            Icon(Icons.home, size: 30),
            Icon(Icons.group, size: 30),
            Icon(Icons.dashboard, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            navigationShell.goBranch(index);
          },
        ),
      ),
      body: navigationShell,
    );
  }
}
