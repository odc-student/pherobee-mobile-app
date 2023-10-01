import 'beekeeper_farm.dart';

class Subowner {
  String? sId;
  String? email;
  List<String>? farmAccess;
  DateTime? createdDate;

  Subowner({this.sId, this.email, this.farmAccess});

  Subowner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];

    createdDate= DateTime.parse(json['createdDate']);
    if (json['farmAccess'] != null) {
      farmAccess = <String>[];
      json['farmAccess'].forEach((v) {
        farmAccess!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;

    data['createdDate']= createdDate;
    if (farmAccess != null) {
      data['farmAccess'] = farmAccess!.map((v) => v).toList();
    }
    return data;
  }
}
