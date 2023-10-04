import 'beehive.dart';

class BeekeeperFarm {
  String? sId;
  String? location;
  List<String>? beehivesId;
  String? name;
  bool? deletable;
  DateTime? createdDate;
  BeekeeperFarm({this.sId, this.location, this.beehivesId, this.name});

  BeekeeperFarm.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'];
    deletable = json['deletable'];
    createdDate= DateTime.parse(json['createdDate']);
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
    data['deletable'] = deletable;
    if (beehivesId != null) {
      data['beehives'] = beehivesId!.map((v) => v).toList();
    }

    data['createdDate']= createdDate;
    data['name'] = name;
    return data;
  }
}
