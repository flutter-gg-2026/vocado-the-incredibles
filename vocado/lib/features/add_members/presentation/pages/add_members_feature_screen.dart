import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_state.dart';
import 'package:vocado/features/add_members/presentation/widgets/empty_card.dart';
import 'package:vocado/features/add_members/presentation/widgets/header.dart';
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

            if (state is AddMembersGroupCreatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Group created successfully'),
                ),
              );

              context.go(Routes.adminDashboard);
            }
          },
          builder: (context, state) {
            if (state is AddMembersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AddMembersErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is AddMembersSuccessState) {
              final members = state.members;
              final cubit = context.read<AddMembersCubit>();

              return Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const Gap(24),
                    const Text(
                      "Add members to your group",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff24224A),
                      ),
                    ),
                    const Gap(24),
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
                                    onTap: () {
                                      cubit.toggleMember(member);
                                    },
                                    child: MemberCard(
                                      member: member,
                                      isSelected: isSelected,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const Gap(24),
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
                        onPressed: () {
                          context.read<AddMembersCubit>().confirmMembers();
                        },
                        child: const Text(
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
            }

            if (state is AddMembersGroupCreatedState) {
              return const Center(child: CircularProgressIndicator());
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}