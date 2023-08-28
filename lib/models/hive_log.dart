class HiveLog {
  String? sId;
  double? temperature;
  double? humidity;
  String? beehive;
  String? timestamp;

  HiveLog({
    this.sId,
    this.temperature,
    this.humidity,
    this.beehive,
    this.timestamp,
  });

  HiveLog.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    beehive = json['beehive'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['beehive'] = beehive;
    data['timestamp'] = timestamp;
    return data;
  }
}
