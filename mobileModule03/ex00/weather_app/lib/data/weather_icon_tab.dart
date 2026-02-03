import 'package:flutter/material.dart';


const Map<int, IconData> weatherCodeMap = {
  0: Icons.wb_sunny,
  1: Icons.wb_sunny,
  2: Icons.wb_cloudy,
  3: Icons.cloud,
  45: Icons.foggy,
  48: Icons.foggy,
  51: Icons.grain,
  53: Icons.grain,
  55: Icons.grain,
  56: Icons.ac_unit,
  57: Icons.ac_unit,
  61: Icons.grain,
  63: Icons.grain,
  65: Icons.grain,
  66: Icons.ac_unit,
  67: Icons.ac_unit,
  71: Icons.ac_unit,
  73: Icons.ac_unit,
  75: Icons.ac_unit,
  77: Icons.ac_unit,
  80: Icons.grain,
  81: Icons.grain,
  82: Icons.grain,
  85: Icons.ac_unit,
  86: Icons.ac_unit,
  95: Icons.thunderstorm,
  96: Icons.thunderstorm,
  99: Icons.thunderstorm,
};

IconData getClosestWeatherIcon(int code) {
  if (weatherCodeMap.containsKey(code)) {
    return weatherCodeMap[code]!;
  }
  // Cherche la clé la plus proche
  int closestKey = weatherCodeMap.keys.reduce((a, b) =>
      (code - a).abs() < (code - b).abs() ? a : b);
  return weatherCodeMap[closestKey]!;
}
