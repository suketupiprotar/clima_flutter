import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
    // print('This line of code trigged');
  }

  void getLocationData() async {

    // latitude = location.latitude;
    // longitude = location.longitude;
    // print(location.latitude);
    // print(location.longitude);
    // getData();

    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        },
      ),
    );
    // print(temperature);
    // print(condition);
    // print(cityName);
  }

  // var longitude = jsonDecode(data)['coord']['lon'];
  // print(longitude);
  // var weatherDescription =  jsonDecode(data)['weather'][0]['description'];
  // print(weatherDescription);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
