import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../class/weather_classes/Weekly_weather.dart';

class DayBloc extends StatelessWidget {
  final dayWeather day;
  const DayBloc({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12.0,
        alignment: WrapAlignment.center,
        children: [
          Text(
            day.date,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "${day.minTemperature}°C",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "${day.maxTemperature}°C",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "${day.weatherDescription}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class WeekBloc extends StatelessWidget {
  final Location loc;
  const WeekBloc({super.key, required this.loc});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemExtent: 35,
      itemCount: loc.actWeather.ww.Week_weather.length,
      itemBuilder: (context, index) {
        final daily = loc.actWeather.ww.Week_weather[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: DayBloc(day: daily),
        );
      },
    );
  }
}
