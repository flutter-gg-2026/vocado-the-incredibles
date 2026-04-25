import 'package:flutter/material.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';

class MemberCard extends StatelessWidget {
  final AddMembersEntity member;
  final bool isSelected;

  const MemberCard({
    super.key,
    required this.member,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final name = member.name.isEmpty ? "Unknown User" : member.name;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffEEF0FF) : Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xff3D35A6),
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Color(0xff24224A),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle : Icons.add_circle_outline,
            color: const Color(0xff3D35A6),
          ),
        ],
      ),
    );
  }
}