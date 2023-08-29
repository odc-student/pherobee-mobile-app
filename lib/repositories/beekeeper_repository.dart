import 'package:pherobee/models/api_response.dart';
import 'package:pherobee/models/beekeeper.dart';
import 'package:pherobee/models/login_response.dart';

import '../data/authentication_service.dart';
import '../data/beekeeper_service.dart';

class BeekeeperRepository {
  final BeekeeperService _beekeeperService;

  BeekeeperRepository(this._beekeeperService);
  Future<ApiResponse<Beekeeper>> loadProfile(String token) async {
    return await _beekeeperService.loadProfile(token);
  }

  Future<void> deleteSubowner(String token,String subownerId) async {
    await _beekeeperService.deleteSubowner(token, subownerId);

  }

  Future<void>editSubowner(String token, String subownerId, String email, String password) async {
    await _beekeeperService.editSubowner(token, subownerId,email,password);

  }

  Future<void> createSubowner(String token, String email, String password) async {
     await _beekeeperService.createSubowner(token, email, password);

  }

  Future<void> deleteFarm(String token, String farmId) async {
    await _beekeeperService.deleteFarm(token,farmId);

  }

  Future<void> editFarm(String token, String farmId, String name, String location) async {
    await _beekeeperService.editFarm(token, farmId,name,location);

  }

  Future<void> createFarm(String token, String name, String location) async {

    await _beekeeperService.createFarm(token, name,location);
  }

  Future<void> associateBeehiveToFarm(String token, String farmId, String beehiveId) async {
    await _beekeeperService.associateBeehiveToFarm(token, farmId,beehiveId);
  }

  Future<void> deleteBeehiveFromFarm(String token, String farmId, String beehiveId) async {
    await _beekeeperService.deleteBeehiveFromFarm(token, farmId,beehiveId);
  }

  Future<void> associateFarmToSubowner(String token,String subownerId, String farmId) async {
    await _beekeeperService.associateFarmToSubowner(token, subownerId,farmId);
  }


  Future<void> deleteFarmFromSubowner(String token,String subownerId, String farmId) async {
    await _beekeeperService.deleteFarmFromSubowner(token, subownerId,farmId);
  }
}
