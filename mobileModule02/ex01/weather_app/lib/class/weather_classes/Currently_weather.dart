import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/weather_description_tab.dart';

class CurrentlyWeather {
  double temperature = 0.0;
  double windSpeed = 0.0;
  String weatherDescription = "";
  CurrentlyWeather();

  Future<void> setCurrentlyWeather(double latitude, double longitude) async {
    final info = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,weather_code,wind_speed_10m&timezone=Europe%2FLondon",
      ),
    );
    if (info.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return;
    }

    final json = jsonDecode(info.body);
    if (json['results'] != null && json['results'].isNotEmpty) {
      temperature = json['results'][0]['temperature'] as double? ?? 0.0;
      windSpeed = json['results'][0]['windspeed'] as double? ?? 0.0;
      int code = json['results'][0]['weathercode'] as int? ?? -1;
      weatherDescription = getWeatherDescription(code);
    }
  }

  void clear() {
    temperature = 0.0;
    windSpeed = 0.0;
    weatherDescription = "";
  }

  void printCurrent() {
    print("CURRENT WEATHER\n....................................................\n");
    print("TEMPERATURE = $temperature C°\n");
    print("WIND SPEED = $windSpeed KM/H\n");
    print("WEATHER = $weatherDescription\n\n");
  }
}
