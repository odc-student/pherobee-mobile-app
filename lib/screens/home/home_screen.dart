import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/home/widgets/farm_summary.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: context.height,
            width: context.width * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(context.medium,context.small,context.medium,context.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.notifications_none_outlined,size: context.high*1.25),
                    ],
                  ),
                ),
                Container(
                  height: context.height * 0.15,
                  decoration: const BoxDecoration(
                      color: AppColors.blueColor3,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0,context.medium,0,context.medium),
                    width: context.width * 0.9,

                    child: const TitleWidget(title: "My Farms(4 )")),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                        FarmSummary(
                          beehivesNumber: 2,
                          farmIsInDanger: true,
                          subownersNumber: 13,
                          farmName: "Nabeuul",
                          location: "NABEL",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
