import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pherobee/utils/load_data.dart';
import 'package:pherobee/models/api_response.dart';
import 'package:pherobee/repositories/beekeeper_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/beekeeper_profile.dart';
import '../../models/login_response.dart';
import '../../repositories/authentication_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authRepository;
  final BeekeeperRepository _beekeeperRepository;
  AuthCubit(this._authRepository, this._beekeeperRepository) : super(LoggedOut());
  void signIn(String email, String password) async {
    emit(AuthInProgress());
    try {

      ApiResponse<LoginResponse> result = await _authRepository.signIn(email, password);
      if (result.header!.success!) {
        _saveToken( result.body!.token!,result.body!.role!);


        emit(AuthSuccess(loginResponse: result.body!));
      } else {
        emit(AuthFailed(error: "Couldn't Authenticate, try again"));
      }
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  void _saveToken(String token,String role) async {
    final prefs = await SharedPreferences.getInstance();
    LocalData localData = LocalData();
    localData.token = token;
    localData.role = role;
    prefs.setString('token', token);
    prefs.setString('role', role);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    LocalData localData= LocalData();
    localData.beehiveSerialNumbers.map((e) async => await FirebaseMessaging.instance.unsubscribeFromTopic(e));

    prefs.remove('token');
    prefs.remove('id');
    emit(LoggedOut());
  }
  // Future<void> verifyUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.get('token');
  //   prefs.get('id');
  //   emit(LoggedOut());
  // }

  Future<void> _saveProfile(BeekeeperProfile beekeeper) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("profile", json.encode(beekeeper));
  }

}
