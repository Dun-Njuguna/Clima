import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '90acdcfd76c9ea933b8eb064c3dbff6b';
const baseUrl = "http://api.openweathermap.org/data/2.5/weather";
const units = "metric";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$baseUrl?q=$cityName&appid=$apiKey&units=$units';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        "$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$units";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
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
