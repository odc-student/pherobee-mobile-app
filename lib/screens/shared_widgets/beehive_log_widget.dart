
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';

import '../../utils/types.dart';

class BeehiveLogUnit extends StatelessWidget {
  const BeehiveLogUnit({
    super.key,
    required this.value,
    required this.danger, required this.logType,
  });

  final bool danger;
  final LogType logType;
  final String value;

  @override
  Widget build(BuildContext context) {
    if (logType == LogType.temperature) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/temperature.svg",
            width: context.medium * .7,
            color: danger ? Colors.red : Colors.black
          ),

          SizedBox(
              width: context.width * 0.2,
              child: Text(
                "Temperature",
                style: TextStyle(color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              )),
          SizedBox(
              width: context.width * 0.1,
              child: Text(value,
                  style: TextStyle(color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold))),
        ],
      );
    } else if (logType == LogType.humidity) {
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/icons/humidity.svg",
              width: context.medium * .7,
              color: danger ? Colors.red : AppColors.blueColor1,
            ),
            SizedBox(
                width: context.width * 0.2,
                child: Text(
                  "Humidity",
                  style: TextStyle(color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,

                ),),
            SizedBox(
                width: context.width * 0.1,
                child: Text(value,
                    style: TextStyle(
                        color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold))),
          ],
        );
    } else  {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/weight.svg",
            width: context.medium * .7,
            color: danger ? Colors.red : AppColors.primaryColor,
          ),
          SizedBox(
              width: context.width * 0.2,
              child: Text(
                'Weight',
                style: TextStyle(color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              )),
          SizedBox(
              width: context.width * 0.1,
              child: SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                child: Text(value,
                    style: TextStyle(color: danger ? Colors.red : Colors.black,fontWeight: FontWeight.bold)),
              )),
        ],
      );
    }
  }
}
