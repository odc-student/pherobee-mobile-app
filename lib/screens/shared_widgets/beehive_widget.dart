import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

import '../../config/colors.dart';
import '../../utils/log_type.dart';
import 'beehive_log_widget.dart';

class BeehiveWidget extends StatelessWidget {
  const BeehiveWidget({
    super.key,
    required this.serialNumber,
    required this.temperature,
    required this.humidity,
    required this.weight,
  });
  final String serialNumber;
  final String temperature;
  final String humidity;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(context.medium, context.small, context.medium, context.small),
      padding: EdgeInsets.all(context.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.orangeColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: AppColors.thirdColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/beehives.png",
                    width: context.width * .07),
                Text("Beehive #$serialNumber",style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: context.width * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BeehiveLogUnit(
                    danger: true,
                    logType: LogType.temperature,
                    value: "${temperature}C"),
                BeehiveLogUnit(

                    logType: LogType.humidity,
                    danger: false,
                    value: "$humidity%"),
                BeehiveLogUnit(

                    logType: LogType.weight,
                    danger: false,
                    value: "${weight}kg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
