import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pherobee/repositories/location_repository.dart';

import '../../models/location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this._locationRepository) : super(LocationNotLoaded());
  final LocationRepository _locationRepository;
  Future<void> loadLocation(String long, String lat ) async{

    emit(LocationLoading());
    try {
      Location location = await _locationRepository.loadLocation(long, lat);
      emit(LocationLoaded(location));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

}
