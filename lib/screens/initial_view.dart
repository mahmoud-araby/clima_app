import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './weathercurrent.dart';
import '../services/weather.dart';
import '14day_weather.dart';
import '24hour_weather.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(builder: (context, data, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(tabs: <Widget>[
            Tab(
              text: 'Now',
            ),
            Tab(
              text: '24 Hours',
            ),
            Tab(
              text: '7 Days',
            ),
          ]),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: TabBarView(children: <Widget>[
                CurrentWeather(),
                HoursViewer(),
                DaysViewer(),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
