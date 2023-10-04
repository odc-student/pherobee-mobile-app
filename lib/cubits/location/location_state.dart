part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationNotLoaded extends LocationState {
  @override
  List<Object> get props => [];
}


class LocationLoading extends LocationState {
  @override
  List<Object> get props => [];
}



class LocationLoaded extends LocationState {
  final Location location;

  const LocationLoaded(this.location);

  @override
  List<Object> get props => [];
}

class LocationError extends LocationState {
  final String error;


  const LocationError(this.error);
  @override
  List<Object> get props => [];
}