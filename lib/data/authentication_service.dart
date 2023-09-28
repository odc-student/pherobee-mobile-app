import "dart:convert";
import "dart:math";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:pherobee/models/login_response.dart";

import "../models/api_response.dart";

class AuthenticationService {

  Future<ApiResponse<LoginResponse>> signIn(email, password) async {
    try {
      // print("dotenv "+dotenv.env['API_ENDPOINT']!);
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/auth/login",
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
