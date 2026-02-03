import '../../data/weather_description_tab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HourlyWeather {
  double temperature = 0.0;
  double windSpeed = 0.0;
  String weatherDescription = "";
  String hour = "";
  HourlyWeather();
}

class TodayWeather {
  final List<HourlyWeather> todayWeatherList = [];
  TodayWeather();

  Future<bool> setTodayWeather(double latitude, double longitude) async {
    try{final info = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,weather_code,wind_speed_10m&timezone=Europe%2FLondon&forecast_days=1",
      ),
    );
    if (info.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return true;
    }
    final json = jsonDecode(info.body);
    if (json['hourly'] != null && json['hourly'].isNotEmpty) {
      List<dynamic> hours = json['hourly']['time'];
      List<dynamic> temperatures = json['hourly']['temperature_2m'];
      List<dynamic> windSpeeds = json['hourly']['wind_speed_10m'];
      List<dynamic> weatherCodes = json['hourly']['weather_code'];

      for (int i = 0; i < temperatures.length; i++) {
        HourlyWeather hw = HourlyWeather();
        hw.hour = hours[i].substring(hours[i].length - 5, hours[i].length);
        hw.temperature = temperatures[i] as double? ?? 0.0;
        hw.windSpeed = windSpeeds[i] as double? ?? 0.0;
        hw.weatherDescription = getWeatherDescription(weatherCodes[i]);
        todayWeatherList.add(hw);
      }
    }
    return false;
    }catch(e) {
        print('Error fetching weekly weather: $e');
        return true;
    }
  }

  void clear() {
    todayWeatherList.clear();
  }

  void printToday() {
    print(
      "TODAY WEATHER\n....................................................\n",
    );
    print("length = ${todayWeatherList.length}\n");
    for (int i = 0; i < todayWeatherList.length; i++) {
      print("HOUR = ${todayWeatherList[i].hour}\n");
      print("TEMPERATURE = ${todayWeatherList[i].temperature}C°\n");
      print("WIND SPEED = ${todayWeatherList[i].windSpeed} KM/H\n");
      print("WEATHER = ${todayWeatherList[i].weatherDescription} \n\n");
    }
  }
}
