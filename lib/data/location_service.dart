
import 'dart:convert';
import "package:http/http.dart" as http;
import '../models/location.dart';

class LocationService {
  Future<Location>loadLocation(String long, String lat) async {
    try {
      final String uri =
          "https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$long&zoom=18&addressdetails=1";
      print(uri);
      final response = await http.get(
        Uri.parse(
          uri
        ),
      );

      if (response.statusCode != 500) {
        Location data =
        Location.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}