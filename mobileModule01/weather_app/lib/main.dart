import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/component/bottomtabbar_tabs.dart';
import 'component/toptabbar_tabs.dart';
import 'component/tabbarview_pages.dart';

void main() {
  runApp(const WeatherApp());
}


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  
  String location = "";

void updateLocation(String searchText) {
    print("Recherche: $searchText");
    setState(() {
      location = searchText;
    });
  }


  void locateMe() async {
	try {
		LocationPermission permission = await Geolocator.checkPermission();
		
		if (permission == LocationPermission.denied){
			permission = await Geolocator.requestPermission();
		}

		if(permission == LocationPermission.deniedForever){
			print('Permissions refusées');
			return;
		}

		Position position = await Geolocator.getCurrentPosition(
			locationSettings: const LocationSettings(
				accuracy: LocationAccuracy.high,
				distanceFilter: 0
			)
		);

		List<Placemark> placemarks = await placemarkFromCoordinates(
			position.latitude, 
			position.longitude
		);
		if (placemarks.isNotEmpty){
			Placemark place = placemarks[0];
			setState(() {
			  location = place.locality ?? place.administrativeArea ?? "localisation inconnue";
			});
		}

		print("ville: $location");
	} catch(e){
		print("Erreur: $e");
	}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber[400],
            toolbarHeight: 10,
            bottom: TabBar(
              
              //isScrollable: true,
              labelPadding: EdgeInsets.zero,
              tabAlignment: TabAlignment.center,
              indicatorColor: Colors.transparent,
              tabs: [
                SearchTab(onSearch: updateLocation),
                VerticalSeparator(),
                LocalisationButton(locateMe: locateMe)
              ]
            ),
          ),
		  body: TabBarView(children: [
			WeatherCurrently(location: location),
			WeatherToday(location: location),
			WeatherWeekly(location: location),
		  ]),
		  bottomNavigationBar: BottomAppBar(
			color: Colors.amber[100],
			height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.22
                  : MediaQuery.of(context).size.height * 0.22,
			child: TabBar(
				tabs: [
					Currently(),
					Today(),
					Weekly(),
				]
			),
		  ),
		
        ))
    );
  }
}



