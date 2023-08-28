import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pherobee/models/beekeeper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/beekeeper_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final BeekeeperRepository _beekeeperRepository;

  ProfileCubit(this._beekeeperRepository) : super(ProfileNotLoaded());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      Beekeeper beekeeper = await _beekeeperRepository.loadProfile(token);
      // _saveProfile(beekeeper);
      emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void deleteSubowner(String subownerId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      await _beekeeperRepository.deleteSubowner(token, subownerId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> createSubowner(String email, String password) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      await _beekeeperRepository.createSubowner(token, email, password);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> editSubowner(
      String subownerId, String email, String password) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      await _beekeeperRepository.editSubowner(
          token, subownerId, email, password);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteFarm(String farmId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      await _beekeeperRepository.deleteFarm(token, farmId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> editFarm(String farmId, String name, String location) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
      await _beekeeperRepository.editFarm(token, farmId, name, location);
      await loadProfile();
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> createFarm(String name, String location) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();

      await _beekeeperRepository.createFarm(token, name, location);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> associateBeehiveToFarm(String farmId, String beehiveId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
// TODO: handle if the beehive is already associated to the farm
      await _beekeeperRepository.associateBeehiveToFarm(token, farmId, beehiveId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteBeehiveFromFarm(String farmId, String beehiveId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();

      await _beekeeperRepository.deleteBeehiveFromFarm(token, farmId, beehiveId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }



  Future<void> associateFarmToSubowner(String subownerId,String farmId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();
// TODO: handle if the beehive is already associated to the farm
      await _beekeeperRepository.associateFarmToSubowner(token,subownerId, farmId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteFarmFromSubowner(String subownerId, String farmId) async {
    emit(ProfileLoading());
    try {
      String token = await _loadToken();

      await _beekeeperRepository.deleteFarmFromSubowner(token,subownerId,farmId);
      await loadProfile();
      // emit(ProfileLoaded(beekeeper));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<String> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    return token;
  }
}
