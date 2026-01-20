import 'package:flutter/material.dart';
import 'Weather_page.dart';
import '../../class/location_class.dart';

class WeatherTabBarView extends StatelessWidget {
  final Location location;

  const WeatherTabBarView({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        WeatherPage(title: "Currently", location: location),
        WeatherPage(title: "Today", location: location),
        WeatherPage(title: "Weekly", location: location),
      ],
    );
  }
}
