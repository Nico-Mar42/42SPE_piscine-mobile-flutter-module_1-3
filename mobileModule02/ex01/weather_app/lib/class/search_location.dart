import './location_class.dart';

class SearchLocation {
  final List<Location> locationList;

  SearchLocation() : locationList = [] {
    for (int i = 0; i < 5; i++) {
      locationList.add(Location());
    }
  }

  void clearAllLocations() {
    locationList.clear();
  }

  void printAllLocations() {
    for (var location in locationList) {
      location.printLocation();
    }
  }

  Location getLocationAt(int index) {
    return locationList[index];
  }
}
