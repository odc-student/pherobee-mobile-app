import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/farms_screen/widgets/app_bar_widget.dart';
import 'package:pherobee/screens/shared_widgets/beehive_widget.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../shared_widgets/navbar.dart';

class FarmsScreen extends StatelessWidget {
  const FarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const Navbar(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.1),
            child: const SafeArea(
                child: AppBarWidget(
              title: "Farm NAbeul",
              location: 'Location',
            ))),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subowners",
                    style: TextStyle(
                      fontSize: context.medium * 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_drop_down_outlined,
                          size: context.medium * 1.5),
                      const Icon(Icons.add),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: context.height * 0.7,
                child: GridView.count(
                  // gridDelegate: ,
                  crossAxisCount: 2,
                  children: const [
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                    BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
