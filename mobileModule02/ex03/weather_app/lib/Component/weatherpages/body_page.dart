import 'package:flutter/material.dart';
import 'Weather_page_today.dart';
import 'Weather_page_current.dart';
import 'Weather_page_weekly.dart';
import '../../class/location_class.dart';

class WeatherTabBarView extends StatelessWidget {
  final Location location;

  const WeatherTabBarView({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        WeatherPageCurrent( location: location),
        WeatherPageToday(location: location),
        WeatherPageWeekly(location: location),
      ],
    );
  }
}
