import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocationData() async {

    final dynamic weatherData = await WeatherModel().getLocationWeather();
    Navigator.push<LocationScreen>(context,
        MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
//dynamic jsonTemperature = jsonDecode(weatherData)['main']['temp'];
//dynamic jsonCondition = jsonDecode(weatherData)['weather'][0]['id'];
//dynamic jsonName = jsonDecode(weatherData)['name'];
