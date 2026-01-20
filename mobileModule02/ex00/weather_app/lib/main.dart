import 'package:flutter/material.dart';
import 'Component/top_bar/top_bar.dart';
import 'Component/weatherpages/body_page.dart';
import 'Component/Bottom_bar/bottom_bar.dart';
import 'Function/locate_me.dart';
import 'Function/update_location.dart';
import 'class/location_class.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});
  
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  
  Location location = Location();

  void setnewState() {
    setState(() {});
  }

  void updateLocationState(String searchText) {
    setState(() {
      location = updateLocation(searchText);
    });
  }

  void locateMeState() async {
    Location loc = await locateMe();
    setState(() {
      location = loc;
    });
  }


  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    location = await locateMe();
    setState(() {
      location = location;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TopBar(
            location: location, 
            updateLocationState: updateLocationState,
            locateMeState: locateMeState,
          ),
          body: WeatherTabBarView(location: location),
          bottomNavigationBar: BottomBar(),
        )
      )
    );
  }
}



