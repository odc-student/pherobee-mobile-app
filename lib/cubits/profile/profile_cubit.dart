

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pherobee/models/api_response.dart';
import 'package:pherobee/models/beekeeper_profile.dart';
import 'package:pherobee/models/subowner_profile.dart';
import 'package:pherobee/repositories/subowner_repository.dart';
import 'package:pherobee/utils/load_data.dart';
import '../../repositories/beekeeper_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final BeekeeperRepository _beekeeperRepository;
  final SubownerRepository _subownerRepository;

  ProfileCubit(this._beekeeperRepository, this._subownerRepository) : super(ProfileNotLoaded());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      // UserData data = await _loadData();
      LocalData localData = LocalData();
      String token = localData.token;
      String role = localData.role;
      if (role == "beekeeper") {
        ApiResponse<BeekeeperProfile> beekeeper =
            await _beekeeperRepository.loadBeekeeperProfile(token);
        emit(BeekeeperProfileLoaded(beekeeper.body!));
      } else if (role == "subowner") {
        ApiResponse<SubownerProfile> subowner =
            await _subownerRepository.loadSubownerProfile(token);
        emit(SubownerProfileLoaded(subowner.body!));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void deleteSubowner(String subownerId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header =
          await _beekeeperRepository.deleteSubowner(token, subownerId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> createSubowner(String email, String password) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header =
          await _beekeeperRepository.createSubowner(token, email, password);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> editSubowner(
      String subownerId, String email, String password) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.editSubowner(
          token, subownerId, email, password);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteFarm(String farmId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.deleteFarm(token, farmId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> editFarm(String farmId, String name, String location) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header =
          await _beekeeperRepository.editFarm(token, farmId, name, location);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> createFarm(String name, String location) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;

      Header header =
          await _beekeeperRepository.createFarm(token, name, location);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> associateBeehiveToFarm(String farmId, String beehiveId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.associateBeehiveToFarm(
          token, farmId, beehiveId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteBeehiveFromFarm(String farmId, String beehiveId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.deleteBeehiveFromFarm(
          token, farmId, beehiveId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> associateFarmToSubowner(String subownerId, String farmId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.associateFarmToSubowner(
          token, subownerId, farmId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteFarmFromSubowner(String subownerId, String farmId) async {
    emit(ProfileLoading());
    try {
      //String token = await _loadToken();
      LocalData localData = LocalData();
      String token = localData.token;
      Header header = await _beekeeperRepository.deleteFarmFromSubowner(
          token, subownerId, farmId);
      await loadProfile();
      if (!header.success!) {
        emit(ProfileError(header.message!));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

}
