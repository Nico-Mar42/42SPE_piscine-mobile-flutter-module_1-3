import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../class/weather_classes/Weekly_weather.dart';
import 'package:fl_chart/fl_chart.dart';


class WeekBloc extends StatelessWidget {
  final Location loc;
  const WeekBloc({super.key, required this.loc});

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
          ? MediaQuery.of(context).size.height * 0.35
          : MediaQuery.of(context).size.width * 0.35,

      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Weekly temperatures",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.02
                  : MediaQuery.of(context).size.width * 0.02,
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
                maxX: 6,
                minY: (getMinMinTemp(loc) - 2).floorToDouble(),
                maxY: (getMaxMaxTemp(loc) + 2).ceilToDouble(),
                
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,

                  horizontalInterval: 2,
                  verticalInterval: 1,
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
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            "${loc.actWeather.ww.Week_weather[value.toInt()].date.substring(8, 10)}/${loc.actWeather.ww.Week_weather[value.toInt()].date.substring(5, 7)}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2,
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
                    spots: loc.actWeather.ww.Week_weather
                        .map((data) => FlSpot(data.order, data.maxTemperature))
                        .toList(),
                    isCurved: false,
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.red],
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

                  LineChartBarData(
                    spots: loc.actWeather.ww.Week_weather
                        .map((data) => FlSpot(data.order, data.minTemperature))
                        .toList(),
                    isCurved: false,
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blue],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.show_chart,
                color: Colors.blue,
                size: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.width * 0.04,
                ),
              Text(
                "Min temperature   ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.017
                    : MediaQuery.of(context).size.width * 0.017,
                ),
              ),
              Icon(
                Icons.show_chart,
                color: Colors.red,
                size: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.width * 0.04,
                ),
              Text(
                "Max temperature",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.017
                    : MediaQuery.of(context).size.width * 0.017,
                ),
              ),
              ],
          )
        ],
      ),
    );
  }
}

double getMaxMaxTemp(Location loc) {
  double max = -double.maxFinite;
  WeeklyWeather ww = loc.actWeather.ww;
  for (int i = 0; i < ww.Week_weather.length; i++) {
    if (ww.Week_weather[i].maxTemperature > max) {
      max = ww.Week_weather[i].maxTemperature;
    }
  }
  return max;
}

double getMinMaxTemp(Location loc) {
  double min = double.maxFinite;
  WeeklyWeather ww = loc.actWeather.ww;
  for (int i = 0; i < ww.Week_weather.length; i++) {
    if (ww.Week_weather[i].maxTemperature < min) {
      min = ww.Week_weather[i].maxTemperature;
    }
  }
  return min;
}

double getMaxMinTemp(Location loc) {
  double max = -double.maxFinite;
  WeeklyWeather ww = loc.actWeather.ww;
  for (int i = 0; i < ww.Week_weather.length; i++) {
    if (ww.Week_weather[i].minTemperature > max) {
      max = ww.Week_weather[i].minTemperature;
    }
  }
  return max;
}

double getMinMinTemp(Location loc) {
  double min = double.maxFinite;
  WeeklyWeather ww = loc.actWeather.ww;
  for (int i = 0; i < ww.Week_weather.length; i++) {
    if (ww.Week_weather[i].minTemperature < min) {
      min = ww.Week_weather[i].minTemperature;
    }
  }
  return min;
}
