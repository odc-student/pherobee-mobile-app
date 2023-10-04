
import '../data/location_service.dart';
import '../models/location.dart';
class LocationRepository{
  final LocationService _locationService;

  LocationRepository(this._locationService);
  Future<Location> loadLocation(String long,String lat) async {
    return await _locationService.loadLocation(long,lat);
  }

}
