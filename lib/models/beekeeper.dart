import 'package:pherobee/models/subowner.dart';

import 'beehive.dart';
import 'farm.dart';

class Beekeeper {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  List<Beehive>? beehives;
  String? forgotPasswordToken;
  List<Farm>? farms;
  List<Subowner>? subowners;

  Beekeeper({
    this.sId,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.beehives,
    this.forgotPasswordToken,
    this.farms,
    this.subowners,
  });

  Beekeeper.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    if (json['beehives'] != null) {

      beehives = <Beehive>[];
      json['beehives'].forEach((v) {

        beehives!.add(Beehive.fromJson(v));
      });
    }
    forgotPasswordToken = json['forgotPasswordToken'];

    if (json['farms'] != null) {
      farms = <Farm>[];
      json['farms'].forEach((v) {
        farms!.add(Farm.fromJson(v));

      });
    }
    if (json['subowners'] != null) {
      subowners = <Subowner>[];
      json['subowners'].forEach((v) {
        subowners!.add(Subowner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    if (beehives != null) {
      data['beehives'] = beehives!.map((v) => v.toJson()).toList();
    }
    data['forgotPasswordToken'] = forgotPasswordToken;
    if (farms != null) {
      data['farms'] = farms!.map((v) => v.toJson()).toList();
    }
    if (subowners != null) {
      data['subowners'] = subowners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
