import '../class/location_class.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

Future<Location> locateMe() async {
  Location loc = Location();
  loc.clearLocation();
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.deniedForever) {
    print('Permissions refusées');
    loc.isGeolocated = false;
    return loc;
  }

  Position position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    ),
  );

  List<geocoding.Placemark> placemarks = await geocoding
      .placemarkFromCoordinates(position.latitude, position.longitude);
  if (placemarks.isNotEmpty) {
    geocoding.Placemark place = placemarks[0];
    loc.cityName = place.locality ?? "";
    loc.regionName = place.administrativeArea ?? "";
    loc.countryName = place.country ?? "";
  }

  print("ville: ${loc.cityName}");
  loc.latitude = position.latitude;
  loc.longitude = position.longitude;
  await loc.actWeather.setWeatherClass(position.longitude, position.latitude);
  loc.isGeolocated = true;
  return loc;
}
