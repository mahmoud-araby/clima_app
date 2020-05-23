import 'package:climaapp/Models/current_module.dart';
import 'package:climaapp/Models/days_module.dart';
import 'package:climaapp/Models/hourly_module.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';
import '../services/networking.dart';

class WeatherModel extends ChangeNotifier {
  NetworkHelper networkHelper = NetworkHelper();
  String currentCity;
  bool isBusy = false;
  List<Placemark> cities = [];
  CurrentModule currentWeather;
  List<DaysModule> daysWeather = [];
  List<HourlyModule> hourlyWeather = [];

  Future getLocationCurrentWeather(Location location) async {
    isBusy = true;
    notifyListeners();
    var weatherData = await networkHelper.getPositionWeather(
        latitude: location.latitude, longitude: location.longitude);
    print(weatherData);
    if (weatherData != null) {
      var weather;
      currentWeather = CurrentModule.formJson(weatherData['current']);
      notifyListeners();
      weatherData['hourly'].forEach((element) {
        weather = HourlyModule.formJson(element);
        hourlyWeather.add(weather);
      });
      notifyListeners();
      for (int count = 0; count < 7; count++) {
        weather = DaysModule.formJson(weatherData['daily'][count]);
        daysWeather.add(weather);
      }
      notifyListeners();
      isBusy = false;
      notifyListeners();
    }
  }

  Future getCurrentWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    await getLocationCurrentWeather(location);
    currentCity = location.city;
    notifyListeners();
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

  getCity(String text) async {
    isBusy = true;
    notifyListeners();
    List<Placemark> placeMark = await Geolocator().placemarkFromAddress(text);
    print(placeMark.first.name);
    cities = placeMark;
    isBusy = false;
    notifyListeners();
  }
}
