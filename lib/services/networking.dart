import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static const apiKey = 'e72ca729af228beabd5d20e3b7749713';
  static const openWeatherMapURL =
      'https://api.openweathermap.org/data/2.5/weather';
  static const openWeatherMapHourlyURL =
      'https://api.openweathermap.org/data/2.5/weather';

  Future getPositionWeather({double longitude, double latitude}) async {
    http.Response response = await http.get(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getCityWeather({String cityName}) async {
    http.Response response = await http
        .get('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getData(dynamic url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data)['main']['temp'];
    } else {
      print(response.statusCode);
    }
  }
}
