import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  static String cityName;
  static int temp;
  int icon;

  Future getCityCurrentWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper();

    var weatherData = await networkHelper.getCityWeather();

    if (weatherData != null) {
      double tmp = weatherData['main']['temp'];
      temp = tmp.toInt();
      icon = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    } else {
      temp = null;
    }
    return weatherData;
  }

  Future getLocationCurrentWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper();

    var weatherData = await networkHelper.getPositionWeather(
        latitude: location.latitude, longitude: location.longitude);

    if (weatherData != null) {
      double tmp = weatherData['main']['temp'];
      temp = tmp.toInt();
      icon = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    } else {
      temp = null;
    }
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
