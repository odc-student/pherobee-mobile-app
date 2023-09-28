
class HiveLog {
  String? sId;
  String? deviceId;
  String? timestamp;
  double? temperatureF;
  double? temperatureC;
  double? humidity;
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

    print(json['timestamp']);
    timestamp = json['timestamp'];
    if(json['temperature_f']!=null && json['temperature_f'] is int ){
      temperatureF = (json['temperature_f']as int).toDouble();
    }else{
      temperatureF = json['temperature_f'];
    }
    if(json['temperature_c']!=null && json['temperature_c'] is int ){
      temperatureC = (json['temperature_c']as int).toDouble();
    }else{
      temperatureC = json['temperature_c'];

    }
    if(json['humidity']!=null && json['humidity'] is int ){
      humidity = (json['humidity']as int).toDouble();
    }else{
      humidity = json['humidity'];
    }
    if(json['weight']!=null && json['weight'] is int ){
      weight = (json['weight']as int).toDouble();
    }else{
      weight = json['weight'];
    }
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