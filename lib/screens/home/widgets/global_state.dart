
import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/screens/beehives/beehives_screen.dart';

import '../../../config/colors.dart';
import '../../shared_widgets/title_widget.dart';

class GlobalStateHomeWidget extends StatelessWidget {
  const GlobalStateHomeWidget({
    super.key, required this.state,
  });

  final BeekeeperProfileLoaded state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BeehivesScreen(),));
          },
          child: Container(
            height: context.height * 0.15,
            width: context.width * 0.4125,
            decoration: const BoxDecoration(
                color: AppColors.blueColor3,
                borderRadius:
                BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TitleWidget(
                  title: state.beekeeper.beehives!.length
                      .toString(),
                ),
                const TitleWidget(title: "Beehives"),
              ],
            ),
          ),
        ),
        Container(
          height: context.height * 0.15,
          width: context.width * 0.4125,
          decoration: const BoxDecoration(
              color: AppColors.blueColor3,
              borderRadius:
              BorderRadius.all(Radius.circular(20))),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TitleWidget(
                title: "TBI",
              ),
              TitleWidget(title: "Issues"),
            ],
          ),
        ),
      ],
    );
  }
}