part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class LoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthInProgress extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final LoginResponse loginResponse;
  @override
  List<Object> get props => [];

  AuthSuccess({required this.loginResponse});
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed({required this.error});
  @override
  List<Object> get props => [];
}
