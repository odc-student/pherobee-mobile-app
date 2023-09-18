import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/app_bar_widget.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../shared_widgets/beehive_widget.dart';
import '../shared_widgets/navbar.dart';

class BeehivesScreen extends StatelessWidget {
  const BeehivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(context.medium),
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                    margin: EdgeInsets.fromLTRB(0, context.medium, 0, context.medium),
                    child: const TitleWidget(title: "My Beehives")),
                const Text("Beehives related to farms #Number",style: TextStyle(fontWeight: FontWeight.w500),),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    );
                  },
                ),
                const Text("Beehives related to farms #Number",style: TextStyle(fontWeight: FontWeight.w500),),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const BeehiveWidget(
                      serialNumber: "123",
                      humidity: "36",
                      temperature: "35",
                      weight: "16",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
