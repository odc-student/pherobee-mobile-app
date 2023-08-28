import "dart:convert";
import "dart:io";
import "package:http/http.dart" as http;
import "package:pherobee/models/beekeeper.dart";
import "package:pherobee/models/login_response.dart";

class BeekeeperService {
  Future<Beekeeper> loadProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://10.0.2.2:5000/v1/api/beekeeper",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      if (response.statusCode == 200) {
        var data = Beekeeper.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to loadProfile');
    }
  }

  Future<void> deleteSubowner(String token, String subownerId) async {
    try {
      var map = <String, dynamic>{};
      map['subownerId'] = subownerId;
      final response = await http.delete(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/delete/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode != 200) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to deleteSubowner');
    }
  }

  Future<void> createSubowner(
      String token, String email, String password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/create/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode == 500) {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception('Failed to create Subowner');
    }
  }

  Future<void> editSubowner(
      String token, String subownerId, String email, String password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      map['subownerId'] = subownerId;
      final response = await http.patch(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/update/subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode == 500) {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception('Failed to editSubowner');
    }
  }

  Future<void> deleteFarm(String token, String farmId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      final response = await http.delete(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/delete/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode != 200) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to deleteFarm');
    }
  }

  Future<void> editFarm(
      String token, String farmId, String name, String location) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['name'] = name;
      map['location'] = location;
      final response = await http.patch(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/update/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode != 200) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to editFarm');
    }
  }

  Future<void> createFarm(String token, String name, String location) async {
    try {
      var map = <String, dynamic>{};
      map['name'] = name;
      map['location'] = location;
      final response = await http.post(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/create/farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);
      if (response.statusCode != 201) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to createFarm');
    }
  }

  Future<void> associateBeehiveToFarm(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.post(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/associate/beehive_to_farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      if (response.statusCode != 201) {
        throw Exception("No data found");
      }
      if (response.statusCode == 400) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<void> deleteBeehiveFromFarm(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.delete(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/delete/beehive_from_farm",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      if (response.statusCode != 200) {
        throw Exception("Problem here");
      }
      if (response.statusCode == 400) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<void> associateFarmToSubowner(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.post(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/associate/farm_to_subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      if (response.statusCode != 200) {
        throw Exception("No data found");
      }
      if (response.statusCode == 400) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<void> deleteFarmFromSubowner(
      String token, String farmId, String beehiveId) async {
    try {
      var map = <String, dynamic>{};
      map['farmId'] = farmId;
      map['beehiveId'] = beehiveId;
      final response = await http.delete(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/beekeepers/delete/farm_from_subowner",
          ),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          body: map);

      if (response.statusCode != 200) {
        throw Exception("Problem here");
      }
      if (response.statusCode == 400) {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

}
