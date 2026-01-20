

class Location {
  double latitude;
  double longitude;
  bool isGeolocated = false;
  bool isFromSearch = false;
  String name;

  Location({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.isGeolocated = true,
    this.isFromSearch = false,
    this.name = "",
  });

 

  void clearLocation() {
    latitude = 0.0;
    longitude = 0.0;
    name = "";
    isGeolocated = false;
  }
}
