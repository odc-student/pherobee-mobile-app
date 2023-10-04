import 'dart:math';

import 'package:pherobee/models/beehive.dart';
import 'package:pherobee/models/hive_log.dart';

import '../models/beekeeper_profile.dart';

//------------------------LogType for the beehives log------------------------------------------------
enum LogType { temperature, humidity, weight }
//------------------------Classify Beehives related ofr not related to farms--------------------------
class ClassifyBeehives {
  late List<Beehive> all;
  late List<Beehive> relatedToFarms;
  late List<Beehive> notRelatedToFarms;
  BeekeeperProfile beekeeper;

  ClassifyBeehives(this.beekeeper) {
    print(beekeeper);
    all = beekeeper.beehives!;
    if (beekeeper.farms!.isEmpty) {
      relatedToFarms = [];
      notRelatedToFarms = beekeeper.beehives!;
      return;
    }
    List<Beehive> allBeehives = beekeeper.beehives!;
    for (var i = 0; i < beekeeper.farms!.length; i++) {
      relatedToFarms.addAll(allBeehives.where(
          (element) => beekeeper.farms![i].beehivesId!.contains(element.sId)));
    }
    notRelatedToFarms = allBeehives
        .where((element) => !relatedToFarms.contains(element))
        .toList();
  }
}

//------------------------Log Converter to the charts------------------------------------------------
class ChartData{

  final DateTime time;
  final double data;

  ChartData(this.time, this.data);
}

class ChartsLog{
  final List<HiveLog> hiveLog;
  late List<ChartData> temperatureData=[];
  late List<ChartData> humidityData=[];
  late List<ChartData> weightData=[];

  ChartsLog(this.hiveLog){
    print("hivelog");
    print(hiveLog.length);
    for (var value in hiveLog) {
      if(value.temperatureC!=null)temperatureData.add(ChartData(value.timestamp!, value.temperatureC!));
      if(value.humidity!=null)humidityData.add(ChartData(value.timestamp!, value.humidity!));
      if(value.weight!=null)weightData.add(ChartData(value.timestamp!, value.weight!));
    }
  }
}


enum ButtonType{
  success,
  error,
  remove
}
