import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../data/weather_icon_tab.dart';

class TodayScroll extends StatelessWidget {
  final Location loc;
  const TodayScroll({super.key, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(57, 129, 109, 47),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.height * 0.9,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.18
          : MediaQuery.of(context).size.width * 0.18,

      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemExtent: 0.1,
        itemCount: loc.actWeather.tw.todayWeatherList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final hourly = loc.actWeather.tw.todayWeatherList[index];
          return Container(
            width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.height * 0.3,
            // margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            color: Colors.transparent,
            child: Column(
              children: [
                Text(hourly.hour,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.021
                      : MediaQuery.of(context).size.width * 0.021,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon( 
                  getClosestWeatherIcon(loc.actWeather.cw.weatherCode),
                  size: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.05
                      : MediaQuery.of(context).size.width * 0.05,
                  color: const Color.fromARGB(255, 12, 166, 177),
                ),
                Text(
                  "${hourly.temperature}°C",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.019
                      : MediaQuery.of(context).size.width * 0.019,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(221, 211, 13, 13),
                  ),
                  ),
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon( 
                Icons.air,
                size: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.04
                    : MediaQuery.of(context).size.width * 0.04,
                color: const Color.fromARGB(255, 12, 166, 177),
              ),
              Text(
                "${hourly.windSpeed}km/h",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.015
                      : MediaQuery.of(context).size.width * 0.015,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ]
          )
              ]
            ),
          );
        },
      ),
    );
  }
}
