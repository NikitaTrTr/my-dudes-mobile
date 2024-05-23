import 'package:latlong2/latlong.dart';

class Location extends LatLng {
  Location(super.latitude, super.longitude);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  Map<String, dynamic> customToJson() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(json['latitude'] as double, json['longitude'] as double);
  }
}

Map<String, dynamic> locationToJson(Location? location) =>
    location?.customToJson() ?? {};

Location locationFromJson(Map<String, dynamic> json) => Location.fromJson(json);
