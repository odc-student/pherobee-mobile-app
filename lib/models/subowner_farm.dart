import 'beehive.dart';

class SubownerFarm {
  String? sId;
  String? location;
  List<Beehive>? beehivesId;
  String? name;
  DateTime? createdDate;

  SubownerFarm({this.sId, this.location, this.beehivesId, this.name});

  SubownerFarm.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'];
    createdDate= DateTime.parse(json['createdDate']);
    print("object");
    if (json['beehives'] != null) {
      beehivesId = <Beehive>[];

      json['beehives'].forEach((v) {
        beehivesId!.add(Beehive.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['location'] = location;
    data['createdDate']= createdDate;
    if (beehivesId != null) {
      data['beehives'] = beehivesId!.map((v) => v).toList();
    }
    data['name'] = name;
    return data;
  }
}
