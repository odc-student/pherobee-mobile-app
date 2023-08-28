import 'hive_log.dart';

class Beehive {
  List<HiveLog>? hiveLog;
  String? sId;
  String? status;
  String? serialNumber;
  String? beekeeper;

  Beehive({
    this.hiveLog,
    this.sId,
    this.status,
    this.serialNumber,
    this.beekeeper,
  });

  Beehive.fromJson(Map<String, dynamic> json) {
    if (json['hiveLog'] != null) {
      hiveLog = <HiveLog>[];
      json['hiveLog'].forEach((v) {
        hiveLog!.add(HiveLog.fromJson(v));

      });
    }
    sId = json['_id'];
    status = json['status'];
    serialNumber = json['serialNumber'];
    beekeeper = json['beekeeper'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hiveLog != null) {
      data['hiveLog'] = hiveLog!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['status'] = status;
    data['serialNumber'] = serialNumber;
    data['beekeeper'] = beekeeper;
    return data;
  }
}
