import "dart:convert";
import "dart:io";
import "package:http/http.dart" as http;
import "package:pherobee/models/api_response.dart";

import "../models/subowner_profile.dart";

class SubownerService{

  Future<ApiResponse<SubownerProfile>> loadSubownerProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://10.0.2.2:5000/v1/api/subowner",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      if (response.statusCode != 500) {
        var data =
        ApiResponse.fromJson(jsonDecode(response.body), SubownerProfile.fromJson);
        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}