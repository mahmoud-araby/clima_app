import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static const apiKey = 'e72ca729af228beabd5d20e3b7749713';
  static const openWeatherMapURL =
      'https://api.openweathermap.org/data/2.5/onecall';

  Future<Map> getPositionWeather({double longitude, double latitude}) async {
    var data;
    try {
      http.Response response = await http.get(
          '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      } else {
        data = null;
      }
    } catch (e) {
      print("error");
      data = null;
    }
    return data;
  }
}
