
class Address {
  String? road;
  String? residential;
  String? suburb;
  String? cityDistrict;
  String? city;
  String? state;
  String? iSO31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  Address({this.road, this.residential, this.suburb, this.cityDistrict, this.city, this.state, this.iSO31662Lvl4, this.postcode, this.country, this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    road = json['road'];
    residential = json['residential'];
    suburb = json['suburb'];
    cityDistrict = json['city_district'];
    city = json['city'];
    state = json['state'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['road'] = road;
    data['residential'] = residential;
    data['suburb'] = suburb;
    data['city_district'] = cityDistrict;
    data['city'] = city;
    data['state'] = state;
    data['ISO3166-2-lvl4'] = iSO31662Lvl4;
    data['postcode'] = postcode;
    data['country'] = country;
    data['country_code'] = countryCode;
    return data;
  }
}

class Location {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? class_;
  String? type;
  int? placeRank;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  Location({this.placeId, this.licence, this.osmType, this.osmId, this.lat, this.lon, this.class_, this.type, this.placeRank, this.importance, this.addresstype, this.name, this.displayName, this.address, this.boundingbox});

  Location.fromJson(Map<String, dynamic> json) {
  placeId = json['place_id'];
  licence = json['licence'];
  osmType = json['osm_type'];
  osmId = json['osm_id'];
  lat = json['lat'];
  lon = json['lon'];
  class_ = json['class'];
  type = json['type'];
  placeRank = json['place_rank'];
  importance = json['importance'];
  addresstype = json['addresstype'];
  name = json['name'];
  displayName = json['display_name'];
  address = json['address'] != null ? Address.fromJson(json['address']) : null;
  boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['place_id'] = placeId;
  data['licence'] = licence;
  data['osm_type'] = osmType;
  data['osm_id'] = osmId;
  data['lat'] = lat;
  data['lon'] = lon;
  data['class'] = class_;
  data['type'] = type;
  data['place_rank'] = placeRank;
  data['importance'] = importance;
  data['addresstype'] = addresstype;
  data['name'] = name;
  data['display_name'] = displayName;
  if (address != null) {
  data['address'] = address!.toJson();
  }
  data['boundingbox'] = boundingbox;
  return data;
  }
}
