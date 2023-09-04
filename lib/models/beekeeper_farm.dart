import 'beehive.dart';

class BeekeeperFarm {
  String? sId;
  String? location;
  List<String>? beehivesId;
  String? name;

  BeekeeperFarm({this.sId, this.location, this.beehivesId, this.name});

  BeekeeperFarm.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'];
    if (json['beehives'] != null) {
      beehivesId = <String>[];

      json['beehives'].forEach((v) {
        beehivesId!.add(v);
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['location'] = location;
    if (beehivesId != null) {
      data['beehives'] = beehivesId!.map((v) => v).toList();
    }
    data['name'] = name;
    return data;
  }
}
