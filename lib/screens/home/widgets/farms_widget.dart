import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/models/beekeeper_farm.dart';
import 'package:pherobee/screens/shared_widgets/add_farm_dialog.dart';

import '../../../utils/types.dart';
import '../../farms/create_farm.dart';
import '../../farms/farm_screen.dart';
import '../../shared_widgets/title_widget.dart';
import 'farm_summary.dart';

class FarmsUnitWidgets extends StatefulWidget {
  const FarmsUnitWidgets({super.key, required this.state});

  final BeekeeperProfileLoaded state;

  @override
  State<FarmsUnitWidgets> createState() => _FarmsUnitWidgetsState();
}

class _FarmsUnitWidgetsState extends State<FarmsUnitWidgets> {
  bool showMore = false;
  List<BeekeeperFarm> farms = [];
  List<BeekeeperFarm> fullFarms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullFarms = widget.state.beekeeper.farms!;
    fullFarms.sort((a, b) => a.deletable == true ? 1 : 0);

    farms = fullFarms
        .getRange(
            0,
            widget.state.beekeeper.farms!.length >= 2
                ? 2
                : widget.state.beekeeper.farms!.length)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return widget.state.beekeeper.farms!.isNotEmpty
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
                          title:
                              "My Farms(${widget.state.beekeeper!.farms!.length})"),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateFarmScreen(),
                                ));

                            // showModalBottomSheet(
                            //   context: context,
                            //   builder: (context) => const AddFarmBottomSheet(),
                            // );
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
                                builder: (context) => FarmScreen(
                                  beehives: widget.state.beekeeper.beehives!
                                      .where((element) =>
                                          e.beehivesId!.contains(element.sId))
                                      .toList(),
                                  location: e.location,
                                  name: e.name!,
                                  subowners: widget.state.beekeeper.subowners!
                                      .where((element) =>
                                          element.farmAccess!.contains(e.sId))
                                      .toList(),
                                  sId: e.sId!,
                                ),
                              ));
                        },
                        child: FarmSummary(
                            beehivesNumber: e.beehivesId!.length,
                            subownersNumber: widget.state.beekeeper.subowners!
                                .where((element) =>
                                    element.farmAccess!.contains(e.sId))
                                .length,
                            farmName: e.name!,
                            location: e.location,
                            deletable: e.deletable!),
                      ),
                    ),
                    farms.length != widget.state.beekeeper.farms!.length
                        ? ButtonWidget(
                            title: "Show More",
                            onTap: () {
                              setState(() {
                                farms = fullFarms;
                                showMore = !showMore;
                              });
                            },
                          )
                        : ButtonWidget(
                            title: "Show Less",
                            onTap: () {
                              setState(() {
                                farms = fullFarms
                                    .getRange(
                                        0,
                                        widget.state.beekeeper.farms!.length >=
                                                2
                                            ? 2
                                            : widget
                                                .state.beekeeper.farms!.length)
                                    .toList();

                                showMore = !showMore;
                              });
                            },
                          ),
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


class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.title,
    required this.onTap, this.type, this.width, this.height,
  });

  final ButtonType? type;
  final Function() onTap;
  final String title;
  double? width ;
  double? height  ;
  @override
  Widget build(BuildContext context) {
    bool isSuccess = type==null || type==ButtonType.success;
    return InkWell(
      onTap: onTap,
      child: Container(
          width:width,
          height:height,
          padding: EdgeInsets.fromLTRB(context.medium, context.small * 1.5,
              context.medium, context.small * 1.5),
          margin: EdgeInsets.all(context.small * 0.5),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSuccess?AppColors.thirdColor:null,
              border:!isSuccess?Border.all(color: Colors.red,style: BorderStyle.solid,width: 2):null,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: !isSuccess?Colors.red:null),
          )),
    );
  }
}
