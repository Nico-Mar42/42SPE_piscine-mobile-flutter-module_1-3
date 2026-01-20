import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/weather_description_tab.dart';

class dayWeather {
  String date = "";
  double maxTemperature = 0.0;
  double minTemperature = 0.0;
  String weatherDescription = "";
  dayWeather();
}

class WeeklyWeather {
  List<dayWeather> Week_weather = [];

  Future<bool> setWeeklyWeather(double latitude, double longitude) async {
    try{final info = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FLondon",
      ),
    );

    if (info.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return true;
    }

    final json = jsonDecode(info.body);
    if (json['daily'] != null && json['daily'].isNotEmpty) {
      List<dynamic> date = json['daily']['time'];
      List<dynamic> weatherCode = json['daily']['weather_code'];
      List<dynamic> tMax = json['daily']['temperature_2m_max'];
      List<dynamic> tMin = json['daily']['temperature_2m_min'];

      for (int i = 0; i < date.length; i++) {
        dayWeather dw = dayWeather();
        dw.date = date[i].toString();
        int code = weatherCode[i];
        dw.weatherDescription = getWeatherDescription(code);
        dw.maxTemperature = tMax[i];
        dw.minTemperature = tMin[i];
        Week_weather.add(dw);
      }
    }
    return false;
    } catch(e) {
        print('Error fetching weekly weather: $e');
        return true;
    }
  }

  void clear() {
    Week_weather.clear;
  }

  void printWeek() {
    print(
      "WEEK WEATHER\n....................................................\n",
    );

    for (int i = 0; i < Week_weather.length; i++) {
      print("DATE = ${Week_weather[i].date}\n");
      print("MAX TEMPERATURE = ${Week_weather[i].maxTemperature}\n");
      print("MIN TEMPERATURE = ${Week_weather[i].minTemperature}\n");
      print("WEATHER = ${Week_weather[i].weatherDescription}\n\n");
    }
  }
}
