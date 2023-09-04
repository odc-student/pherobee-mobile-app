import 'package:pherobee/data/subowner_service.dart';

import '../models/api_response.dart';
import '../models/subowner_profile.dart';

class SubownerRepository{
  final SubownerService _subownerService;

  SubownerRepository(this._subownerService);
  Future<ApiResponse<SubownerProfile>> loadSubownerProfile(String token) async {
    return await _subownerService.loadSubownerProfile(token);
  }

}