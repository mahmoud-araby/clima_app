import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  String city;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      city = await Geolocator()
          .placemarkFromCoordinates(latitude, longitude)
          .then((value) => value.first.name);
    } catch (e) {
      print(e);
    }
  }

  Location({this.latitude, this.longitude});
}
