import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
