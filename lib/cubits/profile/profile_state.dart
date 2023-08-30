part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileNotLoaded extends ProfileState {
  @override
  List<Object> get props => [];
}


class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}


class ProfileLoaded extends ProfileState {
  final BeekeeperProfile beekeeper;

  const ProfileLoaded(this.beekeeper);

  @override
  List<Object> get props => [];
}


class ProfileError extends ProfileState {
  final String error;


  const ProfileError(this.error);
  @override
  List<Object> get props => [];
}