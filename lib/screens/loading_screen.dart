import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/weather.dart';
import 'initial_view.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    await Provider.of<WeatherModel>(context, listen: false).getCurrentWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          duration: Duration(
            seconds: 5,
          ),
          color: Colors.blue,
          size: 200.0,
        ),
      ),
    );
  }
}
