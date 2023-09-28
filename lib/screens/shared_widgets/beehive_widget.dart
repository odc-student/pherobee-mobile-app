import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/models/beehive.dart';
import 'package:pherobee/models/hive_log.dart';
import 'package:pherobee/screens/beehives/beehive_screen.dart';

import '../../config/colors.dart';
import '../../utils/types.dart';
import 'beehive_log_widget.dart';

class BeehiveWidget extends StatelessWidget {
  const BeehiveWidget({
    super.key,
    required this.beehive,
  });
  final Beehive beehive;
  // final String serialNumber;
  // final String temperature;
  // final String humidity;
  // final String weight;
  //todo should be changed maybe
  // final List<HiveLog> hivelogs;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( context.small),
      padding: EdgeInsets.all(context.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.weakOrangeColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: AppColors.thirdColor),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/beehives.png",
                      width: context.width * .07),
                  Text("Beehive #${beehive.serialNumber}",style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BeehiveScreen(chartsLog:ChartsLog(beehive.hiveLog!) ),));
            },
            child: SizedBox(
              height: context.width * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BeehiveLogUnit(
                      danger: true,
                      logType: LogType.temperature,
                      value: beehive.hiveLog!.last.temperatureC.toString()!="null"?"${beehive.hiveLog!.last.temperatureC}C":"null"),
                  BeehiveLogUnit(

                      logType: LogType.humidity,
                      danger: false,
                      value:  beehive.hiveLog!.last.humidity.toString()!="null"?"${ beehive.hiveLog!.last.humidity.toString().substring(0, beehive.hiveLog!.last.humidity.toString().indexOf(".") + 3)} %":"null",),
                  if(beehive.hiveLog!.last.weight!=null)BeehiveLogUnit(

                      logType: LogType.weight,
                      danger: false,
                      value: beehive.hiveLog!.last.weight!.toString()!="null"?"${beehive.hiveLog!.last.weight.toString().substring(0,beehive.hiveLog!.last.weight.toString().indexOf(".")+3)} g":"null"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
