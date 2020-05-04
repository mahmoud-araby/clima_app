import 'package:climaapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherModel>(
      create: (context) => WeatherModel(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: LoadingScreen(),
      ),
    );
  }
}
