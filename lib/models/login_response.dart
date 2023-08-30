import 'package:pherobee/models/beekeeper_profile.dart';

class LoginResponse {
  String? role;
  String? token;

  // Beekeeper? beekeeper;

  LoginResponse({this.role, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['token'] = token;
    return data;
  }
}
