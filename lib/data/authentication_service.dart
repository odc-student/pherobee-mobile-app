import "dart:convert";
import "dart:math";
import "package:http/http.dart" as http;
import "package:pherobee/models/login_response.dart";

class AuthenticationService {

  Future<LoginResponse> signIn(email, password) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = email;
      map['password'] = password;
      print(email);
      print(password);
      final response = await http.post(
          Uri.parse(
            "http://10.0.2.2:5000/v1/api/auth/login",
          ),
          body: map
      );
      if (response.statusCode == 200) {

        var data = LoginResponse.fromJson(jsonDecode(response.body));

        return data;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }
}
