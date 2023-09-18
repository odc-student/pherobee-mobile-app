
class HiveLog {
  String? sId;
  String? deviceId;
  String? timestamp;
  int? temperatureF;
  double? temperatureC;
  int? humidity;
  double? weight;
  bool? hornetDetected;
  bool? motion;

  HiveLog(
      {this.sId,
        this.deviceId,
        this.timestamp,
        this.temperatureF,
        this.temperatureC,
        this.humidity,
        this.weight,
        this.hornetDetected,
        this.motion});

  HiveLog.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceId = json['deviceId'];
    timestamp = json['timestamp'];
    temperatureF = json['temperature_f'];
    temperatureC = json['temperature_c'];
    humidity = json['humidity'];
    weight = json['weight'];
    hornetDetected = json['hornet_detected'];
    motion = json['Motion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['deviceId'] = deviceId;
    data['timestamp'] = timestamp;
    data['temperature_f'] = temperatureF;
    data['temperature_c'] = temperatureC;
    data['humidity'] = humidity;
    data['weight'] = weight;
    data['hornet_detected'] = hornetDetected;
    data['Motion'] = motion;
    return data;
  }
}