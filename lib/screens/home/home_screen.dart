import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/beehives/beehives_screen.dart';
import 'package:pherobee/screens/farms/farms_screen.dart';
import 'package:pherobee/screens/home/widgets/farm_summary.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import 'package:pherobee/utils/types.dart';

import '../../cubits/profile/profile_cubit.dart';
import '../fake/home_screen.dart';
import '../shared_widgets/add_farm_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileNotLoaded) {
              return const Text("Profile not Loaded");
            } else if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            } else if (state is BeekeeperProfileLoaded) {
              return Center(
                child: SizedBox(
                  height: context.height,
                  width: context.width * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(context.medium,
                            context.small, context.medium, context.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.notifications_none_outlined,
                                size: context.high * 1.25),
                          ],
                        ),
                      ),
                      Container(
                        height: context.height * 0.15,
                        decoration: const BoxDecoration(
                            color: AppColors.blueColor3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      state.beekeeper.farms!.isNotEmpty
                          ? Expanded(
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0, context.medium, 0, context.medium),
                                      width: context.width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TitleWidget(
                                              title:
                                                  "My Farms(${state.beekeeper!.farms!.length})"),
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const AddFarmDialog(),
                                                );
                                              },
                                              child: const Icon(Icons.add)),
                                        ],
                                      )),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ...state.beekeeper.farms!.map(
                                            (e) => InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FarmsScreen(
                                                        beehives: state
                                                            .beekeeper.beehives!
                                                            .where((element) => e
                                                                .beehivesId!
                                                                .contains(
                                                                    element
                                                                        .sId))
                                                            .toList(),
                                                        location: e.location!,
                                                        name: e.name!,
                                                        subowners: state
                                                            .beekeeper
                                                            .subowners!
                                                            .where((element) =>
                                                                element
                                                                    .farmAccess!
                                                                    .contains(
                                                                        e.sId))
                                                            .toList(),
                                                        sId: e.sId!,
                                                      ),
                                                    ));
                                              },
                                              child: FarmSummary(
                                                beehivesNumber:
                                                    e.beehivesId!.length,
                                                // todo to be deleted
                                                farmIsInDanger: true,
                                                subownersNumber: 13,
                                                farmName: e.name!,
                                                location: e.location!,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BeehivesScreen(
                                          classifyBeehives: ClassifyBeehives(
                                              state.beekeeper)),
                                    ));
                              },
                              child: const Text(
                                  "No farms yet, click to check your beehives ")),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileError) {
              return ErrorToLoad(error: state.error);
            } else {
              return const Text("D5almna fl Else");
            }
          },
        ),
      ),
    );
  }
}
