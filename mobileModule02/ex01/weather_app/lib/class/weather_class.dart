import './weather_classes/Currently_weather.dart';
import './weather_classes/Today_weather.dart';
import './weather_classes/Weekly_weather.dart';

class WeatherClass {
  final CurrentlyWeather cw = CurrentlyWeather();
  final TodayWeather tw = TodayWeather();
  final WeeklyWeather ww = WeeklyWeather();
  WeatherClass();

  void setWeatherClass(double longitude, double latitude) async{
    await cw.setCurrentlyWeather(latitude, longitude);
    cw.printCurrent();
    await tw.setTodayWeather(latitude, longitude);
    tw.printToday();
    await ww.setWeeklyWeather(latitude, longitude);
    ww.printWeek();
  }

  void clear() {
    cw.clear();
    tw.clear();
    ww.clear();
  }
}
