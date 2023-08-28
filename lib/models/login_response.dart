import 'package:pherobee/models/beekeeper.dart';

class LoginResponse {
  bool? success;
  String? token;
  // Beekeeper? beekeeper;

  LoginResponse({this.success, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];

    // print(json['beekeeper']);
    //
    // beekeeper = json['beekeeper'] != null
    //     ? Beekeeper.fromJson(json['beekeeper'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['token'] = token;
    // if (beekeeper != null) {
    //   data['beekeeper'] = beekeeper!.toJson();
    // }
    return data;
  }
}
