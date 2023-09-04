import 'package:pherobee/models/subowner.dart';

import 'beehive.dart';
import 'beekeeper_farm.dart';

class BeekeeperProfile {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  List<Beehive>? beehives;
  String? forgotPasswordToken;
  List<BeekeeperFarm>? farms;
  List<Subowner>? subowners;

  BeekeeperProfile({
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

  BeekeeperProfile.fromJson(Map<String, dynamic> json) {
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
      farms = <BeekeeperFarm>[];
      json['farms'].forEach((v) {
        farms!.add(BeekeeperFarm.fromJson(v));

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
