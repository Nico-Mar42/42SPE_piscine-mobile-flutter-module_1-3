import 'weather_class.dart';

class Location {
  double latitude;
  double longitude;
  bool isGeolocated = false;
  bool isFromSearch = false;
  bool cityNotFound = false;
  bool apiError = false;
  String cityName;
  String regionName;
  String countryName;
  WeatherClass actWeather = WeatherClass();

  Location({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.isGeolocated = true,
    this.isFromSearch = false,
    this.cityName = "",
    this.regionName = "",
    this.countryName = "",
  });

  void printLocation() {
    print(cityName);
    print(regionName);
    print(countryName);
    print(latitude);
    print(longitude);
  }

  void clearLocation() {
    latitude = 0.0;
    longitude = 0.0;
    cityName = "";
    regionName = "";
    countryName = "";
    isGeolocated = false;
    cityNotFound = false;
    apiError = false;
    actWeather.clear();
  }
}
