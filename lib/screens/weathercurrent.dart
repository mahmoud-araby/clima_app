import 'package:climaapp/services/weather.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(builder: (context, data, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${data.currentWeather.temp}°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${data.getWeatherIcon(data.currentWeather.id)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
                Text(
                  'Feels like ' +
                      data.currentWeather.feelLike.toString() +
                      '°C',
                  style: KFeelLikeStyle,
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Humidity',
                    style: KMainPage,
                  ),
                  BoxedIcon(
                    WeatherIcons.humidity,
                    size: 50,
                  ),
                  Text(
                    data.currentWeather.humidity.toString() + ' %',
                    style: KMainPage,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Wind Speed',
                    style: KMainPage,
                  ),
                  BoxedIcon(
                    WeatherIcons.strong_wind,
                    size: 50,
                  ),
                  Text(
                    data.currentWeather.windSpeed.toString() + ' km/h',
                    style: KMainPage,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Wind Degree',
                    style: KMainPage,
                  ),
                  BoxedIcon(
                    WeatherIcons.wind_direction,
                    size: 50,
                  ),
                  Text(
                    data.currentWeather.windDeg.toString() + ' °',
                    style: KMainPage,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Text(
              " ${data.currentWeather.description}!",
              textAlign: TextAlign.center,
              style: kMessageTextStyle,
            ),
          ),
        ],
      );
    });
  }
}
