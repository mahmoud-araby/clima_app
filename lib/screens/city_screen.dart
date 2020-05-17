import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:google_geocoding/google_geocoding.dart';

import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController _cityController = TextEditingController();
  Geocoding mode = Geocoder.google("AIzaSyBHyq_cQeTMyjOIeR0Og8gAx_Zs0nuP93U",
      language: "en-us");
  GoogleGeocoding googleGeocoding =
      GoogleGeocoding("AIzaSyBHyq_cQeTMyjOIeR0Og8gAx_Zs0nuP93U");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              FlatButton(
                onPressed: () async {
//                    Provider.of<WeatherModel>(context, listen: false)
//                        .getCityWeather(_cityController.text);
                  var addresses =
                      await mode.findAddressesFromQuery(_cityController.text);
                  print(addresses.length);
//                  var result = await googleGeocoding.geocoding
//                      .get(_cityController.text, null);

                  var first = addresses.first;
                  print("${first.addressLine} : ${first.countryName}");
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
