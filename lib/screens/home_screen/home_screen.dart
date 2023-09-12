import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/home_screen/widgets/farm_summary.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              const Icon(Icons.notifications_none_outlined),
              Container(
                height: context.height * 0.15,
                width: context.width * 0.8,
                decoration: const BoxDecoration(
                    color: AppColors.blueColor3,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const TitleWidget(title: "My Farms"),
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
    );
  }
}

