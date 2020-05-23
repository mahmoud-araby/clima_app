import 'package:bezier_chart/bezier_chart.dart';
import 'package:climaapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  @override
  Widget build(BuildContext context) {
    return sample1(context);
  }

  Widget sample1(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width * 0.9,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
          series: const [
            BezierLine(
              data: Provider.of<WeatherModel>(context)
                  .hourlyWeather
                  .map(
                    (e) => DataPoint<double>(
                        value: e.temp.toDouble(),
                        xAxis: DateTime.fromMillisecondsSinceEpoch(e.time)
                            .hour
                            .toDouble()),
                  )
                  .toList(),
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            backgroundColor: Colors.red,
            snap: false,
          ),
        ),
      ),
    );
  }
}
