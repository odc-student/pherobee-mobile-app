import 'package:pherobee/models/api_response.dart';
import 'package:pherobee/models/beekeeper_profile.dart';
import 'package:pherobee/models/subowner_profile.dart';
import '../data/beekeeper_service.dart';

class BeekeeperRepository {
  final BeekeeperService _beekeeperService;

  BeekeeperRepository(this._beekeeperService);
  Future<ApiResponse<BeekeeperProfile>> loadBeekeeperProfile(String token) async {
    return await _beekeeperService.loadBeekeeperProfile(token);
  }

  Future<Header> deleteSubowner(String token,String subownerId) async {
    return await _beekeeperService.deleteSubowner(token, subownerId);

  }

  Future<Header>editSubowner(String token, String subownerId, String email, String password) async {
    return await _beekeeperService.editSubowner(token, subownerId,email,password);

  }

  Future<Header> createSubowner(String token, String email, String password) async {
     return await _beekeeperService.createSubowner(token, email, password);

  }

  Future<Header> deleteFarm(String token, String farmId) async {
    return await _beekeeperService.deleteFarm(token,farmId);

  }

  Future<Header> editFarm(String token, String farmId, String name, String location) async {
    return await  _beekeeperService.editFarm(token, farmId,name,location);
  }

  Future<Header> createFarm(String token, String name, double long ,double lat, String location) async {

    return await _beekeeperService.createFarm(token, name, long, lat,location);
  }

  Future<Header> associateBeehiveToFarm(String token, String farmId, String beehiveId) async {
    return await _beekeeperService.associateBeehiveToFarm(token, farmId,beehiveId);
  }

  Future<Header> deleteBeehiveFromFarm(String token, String farmId, String beehiveId) async {
    return await _beekeeperService.deleteBeehiveFromFarm(token, farmId,beehiveId);
  }

  Future<Header> associateFarmToSubowner(String token,String subownerId, String farmId) async {
    return await _beekeeperService.associateFarmToSubowner(token, subownerId,farmId);
  }


  Future<Header> deleteFarmFromSubowner(String token,String subownerId, String farmId) async {
    return await _beekeeperService.deleteFarmFromSubowner(token, subownerId,farmId);
  }
  Future<Header>createSubownerAndAssignFarm(String token, String subownerName,String subownerEmail, String subownerPassword, String farmId)async {
    return await _beekeeperService.createSubownerAndAssignFarm(token, subownerName,  subownerEmail,subownerPassword,farmId);
  }


}
