import '../class/location_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Location> updateLocation(String searchText) async {
  Location loc = Location();
  loc.clearLocation();
  print("Recherche: $searchText");

  final info = await http.get(
    Uri.parse(
      "https://geocoding-api.open-meteo.com/v1/search?name=$searchText&count=1&language=en&format=json",
    ),
  );

  if (info.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return loc;
  }

  loc.isFromSearch = true;

  final json = jsonDecode(info.body);
  if (json['results'] != null && json['results'].isNotEmpty) {
    loc.cityName = json['results'][0]['name'] as String? ?? "";
    loc.countryName = json['results'][0]['country'] as String? ?? "";
    loc.regionName = json['results'][0]['admin1'] as String? ?? "";
    loc.latitude = json['results'][0]['latitude'] as double? ?? 0.0;
    loc.longitude = json['results'][0]['longitude'] as double? ?? 0.0;
  }
  loc.actWeather.setWeatherClass(loc.longitude, loc.latitude);
  return loc;
}
