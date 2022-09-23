import 'package:geolocator/geolocator.dart';


class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async
  {
    try {
      bool isLocationServiceEnable=await Geolocator.isLocationServiceEnabled();
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // TODO: low to high for high accuracy
      // high then more accuracy and battery will drop more
      // print(position);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {

      print(e);
    }
  }
}