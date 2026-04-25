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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff3D35A6) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor:
                isSelected ? Colors.white : const Color(0xff3D35A6),
            child: Text(
              member.name.isNotEmpty ? member.name[0].toUpperCase() : "?",
              style: TextStyle(
                color: isSelected ? const Color(0xff3D35A6) : Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              member.name,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xff24224A),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          Icon(
            isSelected ? Icons.check_circle : Icons.add_circle_outline,
            color: isSelected ? Colors.white : const Color(0xff3D35A6),
          ),
        ],
      ),
    );
  }
}