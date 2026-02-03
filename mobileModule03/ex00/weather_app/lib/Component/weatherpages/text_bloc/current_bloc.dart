import 'package:flutter/material.dart';
import '../../../class/location_class.dart';
import '../../../data/weather_icon_tab.dart';

class CurrentBloc extends StatelessWidget {
  final Location loc;

  const CurrentBloc({
    super.key,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "${loc.actWeather.cw.temperature}°C",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.06
                  : MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(221, 211, 13, 13),
            ),
          ),
          Padding(padding:  EdgeInsets.only(
            bottom: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.02
              : MediaQuery.of(context).size.width * 0.02,
          )),
          Text(
            loc.actWeather.cw.weatherDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.03
                  : MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
          ),
          Icon( 
            getClosestWeatherIcon(loc.actWeather.cw.weatherCode),
            size: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.1
                : MediaQuery.of(context).size.width * 0.1,
            color: const Color.fromARGB(255, 12, 166, 177),
          ),
          Padding(padding:  EdgeInsets.only(
            bottom: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.02
              : MediaQuery.of(context).size.width * 0.02,
          )),
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
                "${loc.actWeather.cw.windSpeed}km/h",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.03
                      : MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ]
          )
        ]
      )
    );
  }
}