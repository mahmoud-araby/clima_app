import 'package:climaapp/services/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/weather.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(
      builder: (context, data, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: null,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                  controller: _cityController,
                ),
                data.isBusy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : FlatButton(
                        onPressed: () {
                          if (_cityController.text != null ||
                              _cityController.text != '') {
                            data.getCity(_cityController.text);
                          }
                        },
                        child: Text(
                          'Get City',
                          style: kButtonTextStyle,
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: Cities,
                    itemCount: data.cities.length ?? 0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Cities(BuildContext context, int item) {
    return Consumer<WeatherModel>(
      builder: (context, data, child) => FlatButton(
        onPressed: () async {
          await data.getLocationCurrentWeather(Location(
              longitude: data.cities[item].position.longitude,
              latitude: data.cities[item].position.longitude));
          data.currentCity = data.cities[item].name;
          print(data.cities[item].name);
          print(data.cities[item].locality);
          print(data.cities[item].subLocality);
          print(data.cities[item].postalCode);
          print(data.cities[item].subThoroughfare);
          print(data.cities[item].isoCountryCode);
          print(data.cities[item].subAdministrativeArea);
          print(data.cities[item].thoroughfare);
          print(data.cities[item].administrativeArea);
          data.cities.clear();
          Navigator.pop(context);
        },
        child: Card(
          elevation: 15,
          color: Colors.blueAccent,
          margin: EdgeInsets.all(15),
          child: ListTile(
            title: Text(data.cities[item].name +
                ' , ' +
                data.cities[item].locality +
                ' , ' +
                data.cities[item].isoCountryCode),
          ),
        ),
      ),
    );
  }
}
