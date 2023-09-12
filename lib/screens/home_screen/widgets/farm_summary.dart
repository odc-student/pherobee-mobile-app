import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

import '../../../config/colors.dart';

class FarmSummary extends StatelessWidget {
  const FarmSummary({
    super.key,
    required this.farmIsInDanger,
    required this.farmName,
    required this.location,
    required this.beehivesNumber,
    required this.subownersNumber,
  });

  final bool farmIsInDanger;
  final String farmName;
  final String location;
  final int beehivesNumber;
  final int subownersNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.small),
      margin: EdgeInsets.fromLTRB(0, context.small/2, 0, context.small/2),
      width: context.width * 0.8,
      height: context.height * 0.13,
      decoration: const BoxDecoration(
          color: AppColors.orangeColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Image.asset("assets/images/farms_colored.png")),
          SizedBox(
            width: context.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Farm $farmName",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: context.medium,
                        ),
                        Text(location),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Beehives : $beehivesNumber"),
                    Text("Subowners : $subownersNumber"),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: context.width * .05,
            height: context.width * .05,
            decoration: BoxDecoration(
                color: farmIsInDanger ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
