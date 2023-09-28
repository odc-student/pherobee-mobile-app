import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/screens/fake/home_screen.dart';

class FarmsScreen extends StatelessWidget {
  const FarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            }
            if (state is BeekeeperProfileLoaded) {
              return state.beekeeper.farms != null &&
                      state.beekeeper.farms!.isNotEmpty
                  ? Column(
                      children: [
                        const Text("farms"),
                        ...state.beekeeper.farms!.map((e) => Row(
                              children: [
                                Text(e.name!),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileCubit>()
                                          .deleteFarm(e.sId!);
                                    },
                                    child: const Text("Delete")),
                                TextButton(
                                    onPressed: () {
                                      context.read<ProfileCubit>().editFarm(
                                          e.sId!, "new name", "new location");
                                    },
                                    child: const Text("Edit")),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileCubit>()
                                      .associateBeehiveToFarm(e.sId!,state.beekeeper.beehives![0].sId!);
                                    },
                                    child: const Text("Associate")),
                                TextButton(
                                    onPressed: () {
                                      context.read<ProfileCubit>().deleteBeehiveFromFarm(
                                          e.sId!,state.beekeeper.beehives![0].sId! );
                                    },
                                    child: const Text("delete")),
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<ProfileCubit>()
                                  .createFarm('NAME', "LOCAATION");
                              // print(state.beekeeper.farms?.length!.toString());
                            },
                            child: const Text("Create")),
                        Text(state.beekeeper.farms!.length.toString()),
                      ],
                    )
                  : const Text("No Subowners here");
            } else if (state is ProfileError) {
              return ErrorToLoad(error: state.error);
            } else {
              print(state);
              return const Text("Farms Not available");
            }
          },
        ),
      ),
    );
  }
}
