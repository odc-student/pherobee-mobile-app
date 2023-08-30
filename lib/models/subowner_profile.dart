import 'farm.dart';

class SubownerProfile {
  String? sId;
  String? email;
  String? role;
  List<Farm>? farmAccess;
  int? iV;

  SubownerProfile({this.sId, this.email, this.role, this.farmAccess, this.iV});

  SubownerProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    role = json['role'];
    if (json['farmAccess'] != null) {
      farmAccess = <Farm>[];
      json['farmAccess'].forEach((v) {
        farmAccess!.add(Farm.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['role'] = role;
    if (farmAccess != null) {
      data['farmAccess'] = farmAccess!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}