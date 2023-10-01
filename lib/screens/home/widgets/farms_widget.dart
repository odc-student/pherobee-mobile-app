import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/models/beekeeper_farm.dart';
import 'package:pherobee/screens/shared_widgets/add_farm_dialog.dart';

import '../../farms/farms_screen.dart';
import '../../shared_widgets/title_widget.dart';
import 'farm_summary.dart';

class FarmsHomeWidgets extends StatelessWidget {
  const FarmsHomeWidgets({super.key, required this.state, required this.farms});

  final BeekeeperProfileLoaded state;
  final List<BeekeeperFarm> farms;

  @override
  Widget build(BuildContext context) {
    return state.beekeeper.farms!.isNotEmpty
        ? Column(
      children: [
        Container(
            padding:
            EdgeInsets.fromLTRB(0, context.medium, 0, context.medium),
            width: context.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(
                    title: "My Farms(${state.beekeeper!.farms!.length})"),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddFarmDialog(),
                      );
                    },
                    child: const Icon(Icons.add)),
              ],
            )),
        SingleChildScrollView(
          child: Column(
            children: [
              ...farms.map(
                    (e) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FarmsScreen(
                            beehives: state.beekeeper.beehives!
                                .where((element) =>
                                e.beehivesId!.contains(element.sId))
                                .toList(),
                            location: e.location!,
                            name: e.name!,
                            subowners: state.beekeeper.subowners!
                                .where((element) =>
                                element.farmAccess!.contains(e.sId))
                                .toList(),
                            sId: e.sId!,
                          ),
                        ));
                  },
                  child: FarmSummary(
                    beehivesNumber: e.beehivesId!.length,
                    // todo to be deleted
                    farmIsInDanger: true,
                    subownersNumber: 13,
                    farmName: e.name!,
                    location: e.location!,
                  ),
                ),
              ),
              Container(
                  width: context.width * 0.4,
                  padding: EdgeInsets.fromLTRB(
                      context.medium,
                      context.small * 1.5,
                      context.medium,
                      context.small * 1.5),
                  margin: EdgeInsets.all(context.small * 0.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.thirdColor),
                  child: const Text(
                    "Show More",
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        )
      ],
    )
        : Column(
      children: [
        Container(
            padding:
            EdgeInsets.fromLTRB(0, context.medium, 0, context.medium),
            width: context.width * 0.9,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(title: "Farms"),
              ],
            )),
        Container(
          padding: EdgeInsets.all(context.small),
          margin: EdgeInsets.fromLTRB(
              0, context.small / 2, 0, context.small / 2),
          width: context.width * 0.9,
          height: context.height * 0.13,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.5),
                width: 3,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: const Center(
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
