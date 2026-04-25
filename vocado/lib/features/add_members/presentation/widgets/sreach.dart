
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400),
          const SizedBox(width: 10),
          Text(
            "Search member",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
