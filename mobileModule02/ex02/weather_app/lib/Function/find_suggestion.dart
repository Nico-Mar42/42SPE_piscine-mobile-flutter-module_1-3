import '../class/search_location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<SearchLocation> findsuggestion(String searchText) async {
  SearchLocation sl = SearchLocation();

  final info = await http.get(
    Uri.parse(
      "https://geocoding-api.open-meteo.com/v1/search?name=$searchText&count=5&language=en&format=json",
    ),
  );

  if (info.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return sl;
  }

  final json = jsonDecode(info.body);
  if (json['results'] != null && json['results'].isNotEmpty) {
    for (int i = 0; i < 5; i++) {
      sl.locationList[i].cityName = json['results'][i]['name'] as String? ?? "";
      sl.locationList[i].countryName = json['results'][i]['country'] as String? ?? "";
      sl.locationList[i].regionName = json['results'][i]['admin1'] as String? ?? "";
      sl.locationList[i].latitude = json['results'][i]['latitude'] as double? ?? 0.0;
      sl.locationList[i].longitude = json['results'][i]['longitude'] as double? ?? 0.0;
    }
  }
  return sl;
}
