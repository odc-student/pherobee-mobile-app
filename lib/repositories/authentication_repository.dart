import 'package:pherobee/models/api_response.dart';
import 'package:pherobee/models/login_response.dart';

import '../data/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService authentication;

  AuthenticationRepository(this.authentication);

  Future<ApiResponse<LoginResponse>> signIn(email, password) async {
    return await authentication.signIn(email, password);
  }
}
