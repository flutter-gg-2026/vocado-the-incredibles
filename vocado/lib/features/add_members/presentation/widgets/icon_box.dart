import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const IconBox({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, size: 20, color: const Color(0xff24224A)),
      ),
    );
  }
}
