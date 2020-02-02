import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '8f80e368ee693ecebe64fec177ef044e';
const String openWeatherMApUrl =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationByCity(String city)async{
    final NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMApUrl?q=$city&appid=$apiKey&units=metric&lang=ua');
    final dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    try {
      final Location current = Location();
      await current.getCurrentLocation();
      final NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMApUrl?lat=${current.latitude}&lon=${current.longitude}&appid=$apiKey&units=metric&lang=ua');
      final dynamic weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
