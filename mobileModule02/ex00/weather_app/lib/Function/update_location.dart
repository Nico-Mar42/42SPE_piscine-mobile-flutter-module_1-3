import '../class/location_class.dart';

Location updateLocation(String searchText) {
  Location loc = Location();
  loc.clearLocation();
  print("Recherche: $searchText");
  loc.name = searchText;
  loc.isFromSearch = true;
  return loc;
}