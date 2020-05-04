import 'package:climaapp/services/weather.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'city_screen.dart';

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(builder: (context, data, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.near_me,
                  size: 50.0,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CityScreen();
                  }));
                },
                child: Icon(
                  Icons.location_city,
                  size: 50.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              children: <Widget>[
                Text(
                  '${data.currentWeather.temp}',
                  style: kTempTextStyle,
                ),
                Text(
                  '${data.getWeatherIcon(data.currentWeather.id)}',
                  style: kConditionTextStyle,
                ),
              ],
            ),
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
