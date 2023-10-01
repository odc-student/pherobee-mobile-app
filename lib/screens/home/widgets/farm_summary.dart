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
      margin: EdgeInsets.fromLTRB(0, context.small / 2, 0, context.small / 2),
      width: context.width * 0.9,
      height: context.height * 0.13,
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
              style: BorderStyle.solid,),
          // color: AppColors.orangeColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
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
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.edit),
              Icon(Icons.delete_sharp),
            ],
          ),
        ],
      ),
    );
  }
}
