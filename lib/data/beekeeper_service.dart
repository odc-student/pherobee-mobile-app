import "dart:convert";
import "dart:io";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:pherobee/models/api_response.dart";
import "package:pherobee/models/beekeeper_profile.dart";

class BeekeeperService {
  Future<ApiResponse<BeekeeperProfile>> loadBeekeeperProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${dotenv.env['API_ENDPOINT']}/v1/api/beekeeper",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      if (response.statusCode != 500) {
        var data =
            ApiResponse.fromJson(jsonDecode(response.body), BeekeeperProfile.fromJson);
        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to loadProfile');
    }
  }



  Future<Header> deleteSubowner(String token, String subownerId) async {
    try {
      var map = <String, dynamic>{};
      map['subownerId'] = subownerId;
      final response = await http.delete(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/delete/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to deleteSubowner');
    }
  }

  Future<Header> createSubowner(
      String token, String email, String password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/create/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to create Subowner');
    }
  }

  Future<Header> editSubowner(
      String token, String subownerId, String email, String password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      map['subownerId'] = subownerId;
      final response = await http.patch(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/update/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to editSubowner');
    }
  }

  Future<Header> deleteFarm(String token, String farmId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      final response = await http.delete(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/delete/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to deleteFarm');
    }
  }

  Future<Header> editFarm(
      String token, String farmId, String name, String location) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['name'] = name;
      map['location'] = location;
      final response = await http.patch(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/update/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to editFarm');
    }
  }

  Future<Header> createFarm(String token, String name, double long ,double lat, String location) async {
    try {
      var map = <String, dynamic>{};
      map['name'] = name;
      map['location'] = location;
      map['long'] = long.toString();
      map['lat'] = lat.toString();

      print("Hello");
      print(map);
      print("${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/create/farm");
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/create/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      print("Hello");
      print(Header.fromJson(json.decode(response.body)["header"]));
      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Failed to createFarm ${e.toString()}');
    }
  }

  Future<Header> associateBeehiveToFarm(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/associate/beehive_to_farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<Header> deleteBeehiveFromFarm(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.delete(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/delete/beehive_from_farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<Header> associateFarmToSubowner(
      String token, String subownerId, String farmId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['subownerId'] = subownerId;
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/associate/farm_to_subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<Header> deleteFarmFromSubowner(
      String token, String subownerId, String farmId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['subownerId'] = subownerId;
      final response = await http.delete(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/delete/farm_from_subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }


  Future<Header> createSubownerAndAssignFarm(
      String token, String subownerName, String subownerEmail, String subownerPassword, String farmId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['username'] = subownerName;
      map['email'] = subownerEmail;
      map['password'] = subownerPassword;
      final response = await http.post(
          Uri.parse(
            "${dotenv.env['API_ENDPOINT']}/v1/api/beekeepers/create/create_subowner/assign/farm_to_subowner",
          ),

          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      return Header.fromJson(json.decode(response.body)["header"]);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
