import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../class/weather_classes/Today_weather.dart';

class HourBloc extends StatelessWidget {
  final HourlyWeather hor;
  const HourBloc({super.key, required this.hor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12.0,
        alignment: WrapAlignment.center,
        children: [
          Text(
            hor.hour,
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
            "${hor.temperature}°C",
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
            "${hor.windSpeed}km/h",
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

class TodayBloc extends StatelessWidget {
  final Location loc;
  const TodayBloc({super.key, required this.loc});

  @override
  @override
  Widget build(BuildContext context) {
     return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemExtent: 35,
      itemCount: loc.actWeather.tw.todayWeatherList.length,
      itemBuilder: (context, index) {
        final hourly = loc.actWeather.tw.todayWeatherList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: HourBloc(hor: hourly),
        );
      },
    );
  }
}
