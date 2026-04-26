
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart';

class AddedMembersBox extends StatelessWidget {
  final List<AddMembersEntity> members;

  const AddedMembersBox({
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddMembersCubit>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffEAF0FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff3D35A6).withValues(alpha: .15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Added Members",
            style: TextStyle(
              color: Color(0xff24224A),
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap(12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: members.map((member) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => cubit.removeSelectedMember(member),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff3D35A6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Text(
                            member.name.isNotEmpty
                                ? member.name[0].toUpperCase()
                                : "?",
                            style: const TextStyle(
                              color: Color(0xff3D35A6),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Text(
                          member.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(6),
                        const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}