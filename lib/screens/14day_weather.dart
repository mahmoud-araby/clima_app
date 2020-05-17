import 'package:climaapp/services/weather.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class DaysViewer extends StatefulWidget {
  @override
  _DaysViewerState createState() => _DaysViewerState();
}

class _DaysViewerState extends State<DaysViewer> {
  List<bool> showData = [false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(
      builder: (BuildContext context, WeatherModel model, Widget child) {
        return ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int itemNumber) {
            return Padding(
              padding: EdgeInsets.all(4),
              child: Material(
                elevation: 12,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showData[itemNumber] = !showData[itemNumber];
                      print('hi');
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    DateFormat('EEE, d \nMMM').format(
                                        DateTime.now()
                                            .add(Duration(days: itemNumber))),
                                    style: kDaysTextStyle,
                                  ),
                                  Text(
                                    model.daysWeather[itemNumber].description,
                                    style: TextStyle(
                                      color: Colors.white.withRed(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  model.daysWeather[itemNumber].humidity
                                          .toString() +
                                      '%',
                                  style: kDaysTextStyle.copyWith(
                                      color: Colors.lightBlueAccent),
                                ),
                                Text(
                                  " " +
                                      model.getWeatherIcon(
                                          model.daysWeather[itemNumber].id) +
                                      " ",
                                  style: kDaysTextStyle.copyWith(fontSize: 28),
                                ),
                                Text(
                                  model.daysWeather[itemNumber].max.toString() +
                                      '°C',
                                  style: kDaysTextStyle,
                                ),
                                Text(
                                  " : ",
                                  style: kDaysTextStyle,
                                ),
                                Text(
                                  model.daysWeather[itemNumber].min.toString() +
                                      '°C',
                                  style: kDaysTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      showData[itemNumber] == true
                          ? FullDayData(itemNumber)
                          : Container(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class FullDayData extends StatelessWidget {
  final int index;
  FullDayData(this.index);
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(
      builder: (context, model, child) => Container(
        width: double.infinity,
        child: Material(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          elevation: 20,
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Morning'),
                    Text(model.daysWeather[index].morn.toString() + '°C'),
                    Text('feelLike'),
                    Text(model.daysWeather[index].mornFeelLike.toString() +
                        '°C'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Day        '),
                    Text(model.daysWeather[index].day.toString() + '°C'),
                    Text('feelLike'),
                    Text(
                        model.daysWeather[index].dayFeelLike.toString() + '°C'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Evening '),
                    Text(model.daysWeather[index].eve.toString() + '°C'),
                    Text('feelLike'),
                    Text(
                        model.daysWeather[index].eveFeelLike.toString() + '°C'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Night     '),
                    Text(model.daysWeather[index].night.toString() + '°C'),
                    Text('feelLike'),
                    Text(model.daysWeather[index].nightFeelLike.toString() +
                        '°C'),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Wind Speed"),
                    BoxedIcon(WeatherIcons.wind),
                    Text(model.daysWeather[index].windSpeed.toString() +
                        " km/h"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Humidity"),
                    BoxedIcon(WeatherIcons.humidity),
                    Text(model.daysWeather[index].humidity.toString() + " %"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
