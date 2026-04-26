import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/view_members/presentation/cubit/view_members_cubit.dart';
import 'package:vocado/features/view_members/presentation/cubit/view_members_state.dart';

class ViewMembersFeatureScreen extends StatelessWidget {
  const ViewMembersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5FB),
      appBar: AppBar(
        title: const Text('Members'),
        centerTitle: true,
        backgroundColor: const Color(0xffF4F5FB),
        foregroundColor: const Color(0xff24224A),
        elevation: 0,
      ),
      body: BlocBuilder<ViewMembersCubit, ViewMembersState>(
        builder: (context, state) {
     
          if (state is ViewMembersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

     
          if (state is ViewMembersErrorState) {
            return Center(child: Text(state.message));
          }

 
          if (state is ViewMembersSuccessState) {
            final members = state.members;

            if (members.isEmpty) {
              return const Center(
                child: Text(
                  'No members found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff24224A),
                  ),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(22),
              itemCount: members.length,
              separatorBuilder: (_, __) => const Gap(14),
              itemBuilder: (context, index) {
                final member = members[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .04),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
               
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xffEAF0FF),
                        child: Text(
                          member.name.isNotEmpty
                              ? member.name[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            color: Color(0xff1E4FD8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      const Gap(14),

          
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              member.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff24224A),
                              ),
                            ),
                            const Gap(5),

                            Text(
                              member.email,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const Gap(8),

               
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffEAF0FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                member.role,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1E4FD8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}