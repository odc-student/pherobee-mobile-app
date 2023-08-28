import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';

class SubownersScreen extends StatelessWidget {
  const SubownersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            }
            if (state is ProfileLoaded) {
              return state.beekeeper.subowners != null &&
                      state.beekeeper.subowners!.isNotEmpty
                  ? Column(
                      children: [
                        ...state.beekeeper.subowners!.map((e) => Row(
                              children: [
                                Text(e.email!),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileCubit>()
                                          .deleteSubowner(e.sId!);
                                    },
                                    child: const Text("Delete")),
                                TextButton(
                                    onPressed: () {
                                      context.read<ProfileCubit>().editSubowner(
                                          e.sId!, "editedMail", "1234");
                                    },
                                    child: const Text("Edit")),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileCubit>()
                                          .associateFarmToSubowner(
                                              e.sId!,
                                              state
                                                  .beekeeper.beehives![0].sId!);
                                    },
                                    child: const Text("associate")),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileCubit>()
                                          .deleteFarmFromSubowner(
                                              e.sId!,
                                              state
                                                  .beekeeper.beehives![0].sId!);
                                    },
                                    child: const Text("delete")),
                              ],
                            )),
                        Text(state.beekeeper.subowners!.length.toString()),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<ProfileCubit>()
                                  .createSubowner('louay2', "1234");
                              print(state.beekeeper.subowners?.length!
                                  .toString());
                            },
                            child: const Text("Create")),
                      ],
                    )
                  : const Text("No Subowners here");
            } else {
              return const Text("Farms Not available");
            }
          },
        ),
      ),
    );
  }
}
