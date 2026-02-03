import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../class/weather_classes/Today_weather.dart';

class TodayBloc extends StatelessWidget {
  final Location loc;
  const TodayBloc({super.key, required this.loc});

  @override
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(57, 129, 109, 47),
        borderRadius: BorderRadius.circular(16),
      ),

      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.height * 0.9,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.3
          : MediaQuery.of(context).size.width * 0.3,

      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Today temperatures",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.01
                  : MediaQuery.of(context).size.width * 0.01,
            ),
          ),

          Container(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.height * 0.8,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.width * 0.25,

            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 23,
                minY: (getMinTemp(loc) - 1).floorToDouble(),
                maxY: (getMaxTemp(loc) + 1).ceilToDouble(),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,

                  horizontalInterval: 1,
                  verticalInterval: 4,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.2),
                    strokeWidth: 2,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.2),
                    strokeWidth: 2,
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      // reservedSize: 30,
                      interval: 4,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            '${value.toInt()}:00h',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            '${value.toInt()}°C',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: loc.actWeather.tw.todayWeatherList
                        .map(
                          (data) => FlSpot(
                            double.parse(data.hour.substring(0, 2)),
                            data.temperature,
                          ),
                        )
                        .toList(),
                    isCurved: true,
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.red],
                    ),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                            radius: 3,
                            color: Colors.white,
                            strokeWidth: 2,
                            strokeColor: Colors.blue,
                          ),
                    ),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withValues(alpha: 0.3),
                          Colors.red.withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        


        ],
      ),
    );
  }
}

double getMaxTemp(Location loc) {
  double max = -double.maxFinite;
  TodayWeather tw = loc.actWeather.tw;
  for (int i = 0; i < tw.todayWeatherList.length; i++) {
    // print("tw.temp = ${tw.todayWeatherList[i].temperature}");
    if (tw.todayWeatherList[i].temperature > max) {
      max = tw.todayWeatherList[i].temperature;
    }
  }
  // print("max = $max");

  return max;
}

double getMinTemp(Location loc) {
  double min = double.maxFinite;
  TodayWeather tw = loc.actWeather.tw;
  for (int i = 0; i < tw.todayWeatherList.length; i++) {
    // print("tw.temp = ${tw.todayWeatherList[i].temperature}");
    if (tw.todayWeatherList[i].temperature < min) {
      min = tw.todayWeatherList[i].temperature;
    }
  }
  // print("min = $min");
  return min;
}
