import 'dart:async';

import 'package:location/location.dart';

class UserLocation {
  final double lat;
  final double lon;

  UserLocation({
    this.lat,
    this.lon,
  });
}

class LocationService {
  Location location = Location();

  StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationStreamController.add(
              UserLocation(
                  lat: locationData.latitude, lon: locationData.longitude),
            );
          }
        });
      }
    });
  }

  void dispose() => _locationStreamController.close();
}
