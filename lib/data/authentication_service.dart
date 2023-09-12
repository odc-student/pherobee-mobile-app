import "dart:convert";
import "dart:math";
import "package:http/http.dart" as http;
import "package:pherobee/models/login_response.dart";

import "../models/api_response.dart";

class AuthenticationService {

  Future<ApiResponse<LoginResponse>> signIn(email, password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(
          Uri.parse(
            "http://192.168.1.113:5000/v1/api/auth/login",
          ),
          body: map
      );
      if (response.statusCode == 200) {

        var data = ApiResponse.fromJson(jsonDecode(response.body),LoginResponse.fromJson);

        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }
}
