import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pherobee/repositories/beekeeper_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/beekeeper.dart';
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
      LoginResponse result = await _authRepository.signIn(email, password);
      if (result.success!) {
        _saveToken( result.token!);
        emit(AuthSuccess(loginResponse: result));
      } else {
        emit(AuthFailed(error: "Couldn't Authenticate, try again"));
      }
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  void _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token);
    // prefs.setString('id', id);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
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

  Future<void> _saveProfile(Beekeeper beekeeper) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("profile", json.encode(beekeeper));
  }

}
