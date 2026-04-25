import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_state.dart';
import 'package:vocado/features/add_members/presentation/widgets/added_members_box.dart';
import 'package:vocado/features/add_members/presentation/widgets/empty_card.dart';
import 'package:vocado/features/add_members/presentation/widgets/member_card.dart';

class AddMembersFeatureScreen extends StatelessWidget {
  const AddMembersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5FB),
      body: SafeArea(
        child: BlocConsumer<AddMembersCubit, AddMembersState>(
          listener: (context, state) {
            if (state is AddMembersErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AddMembersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            final cubit = context.read<AddMembersCubit>();

            final members = switch (state) {
              AddMembersSuccessState() => state.members,
              AddMembersConfirmedState() => state.members,
              AddMembersCreatingState() => cubit.lastMembers,
              AddMembersErrorState() => cubit.lastMembers,
              _ => cubit.lastMembers,
            };

            final confirmedMembers = switch (state) {
              AddMembersConfirmedState() => state.confirmedMembers,
              _ => <AddMembersEntity>[],
            };

            return Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  const Gap(24),

                  const Text(
                    "Add members to your group",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff24224A),
                    ),
                  ),

                  const Gap(20),

                  if (confirmedMembers.isNotEmpty) ...[
                    AddedMembersBox(members: confirmedMembers),
                    const Gap(22),
                  ],

                  const Text(
                    "Members",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff24224A),
                    ),
                  ),

                  const Gap(14),

                  Expanded(
                    child: members.isEmpty
                        ? const EmptyCard()
                        : ListView.separated(
                            itemCount: members.length,
                            separatorBuilder: (context, index) =>
                                const Gap(12),
                            itemBuilder: (context, index) {
                              final member = members[index];
                              final isSelected =
                                  cubit.selectedMembers.contains(member);

                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(22),
                                  onTap: state is AddMembersCreatingState
                                      ? null
                                      : () => cubit.toggleMember(member),
                                  child: MemberCard(
                                    member: member,
                                    isSelected: isSelected,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  const Gap(20),

                  SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3D35A6),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: state is AddMembersCreatingState
                          ? null
                          : () => cubit.confirmMembers(),
                      child: state is AddMembersCreatingState
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Confirm Members",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
