import 'farm.dart';

class Subowner {
  String? sId;
  String? email;
  List<Farm>? farmAccess;

  Subowner({this.sId, this.email, this.farmAccess});

  Subowner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    if (json['farmAccess'] != null) {
      farmAccess = <Farm>[];
      json['farmAccess'].forEach((v) {
        farmAccess!.add(Farm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    if (farmAccess != null) {
      data['farmAccess'] = farmAccess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
