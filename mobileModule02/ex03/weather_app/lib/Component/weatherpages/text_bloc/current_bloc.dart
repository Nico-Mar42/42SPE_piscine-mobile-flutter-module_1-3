import 'package:flutter/material.dart';
import '../../../class/location_class.dart';


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
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
          Text(
          "${loc.actWeather.cw.windSpeed}km/h",
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
        loc.actWeather.cw.weatherDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.width * 0.02,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        ]
      )
    );
  }
}