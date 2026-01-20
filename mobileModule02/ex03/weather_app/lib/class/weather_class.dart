import './weather_classes/Currently_weather.dart';
import './weather_classes/Today_weather.dart';
import './weather_classes/Weekly_weather.dart';

class WeatherClass {
  final CurrentlyWeather cw = CurrentlyWeather();
  final TodayWeather tw = TodayWeather();
  final WeeklyWeather ww = WeeklyWeather();
  WeatherClass();

  Future<bool> setWeatherClass(double longitude, double latitude) async {
    if (await cw.setCurrentlyWeather(latitude, longitude) == true ||
        await tw.setTodayWeather(latitude, longitude) == true ||
        await ww.setWeeklyWeather(latitude, longitude) == true) {
      return true;
    }
    return false;
  }

  void clear() {
    cw.clear();
    tw.clear();
    ww.clear();
  }
}
