import 'package:flutter/material.dart';
import 'Component/top_bar/top_bar.dart';
import 'Component/weatherpages/body_page.dart';
import 'Component/Bottom_bar/bottom_bar.dart';
import 'Function/locate_me.dart';
import 'Function/update_location.dart';
import 'class/location_class.dart';
import 'dart:async';
import 'Function/find_suggestion.dart';
import 'Component/top_bar/suggestion.dart';
import 'class/search_location.dart';

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
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  SearchLocation suggestion = SearchLocation();
  Timer? debounceTimer;

  void updateLocationSuggestion(Location loc) async {
    loc.apiError = await loc.actWeather.setWeatherClass(loc.longitude, loc.latitude);
    setState(() {
      if (loc.cityName == "") {
        loc.cityNotFound = true;
        return;
      }
      location = loc; 
      searchController.clear();
      suggestion.clearAllLocations();
      searchFocusNode.unfocus();
    });
    //print(loc.longitude);
    //location.actWeather.cw.printCurrent();
  }

  void updateLocationState(String searchText) async {
    location = await updateLocation(searchText);
    location.apiError = await location.actWeather.setWeatherClass(
      location.longitude,
      location.latitude,
    );
    setState(() {
      suggestion.clearAllLocations();
      searchFocusNode.unfocus();
    });
  }

  void locateMeState() async {
    Location loc = await locateMe();
    setState(() {
      location = loc;
    });
    //location.actWeather.cw.printCurrent();
  }

  @override
  void initState() {
    super.initState();
    locateMeState();

    searchController.addListener(() {
      if (!searchFocusNode.hasFocus) return;

      debounceTimer?.cancel();
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        _handleSearchChanged(searchController.text);
      });
    });

    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus && searchController.text.isNotEmpty) {
        setState(() {
          suggestion.clearAllLocations();
        });
      }
    });
  }

  void _handleSearchChanged(String searchtext) async {
    if (searchtext.isEmpty) {
      setState(() => suggestion.clearAllLocations());
      return;
    }


    try {
      final result = await findsuggestion(searchtext);
      //print(searchFocusNode);
      setState(() {
        suggestion = result;
      });
    } catch (e) {
      print('Erreur : $e');
    }
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
            searchController: searchController,
            searchFocusNode: searchFocusNode,
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                WeatherTabBarView(location: location),
                if (searchController.text.isNotEmpty &&
                    suggestion.locationList.isNotEmpty)
                  SuggestionList(
                    suggestion: suggestion,
                    updateLocationState: updateLocationSuggestion,
                    searchController: searchController,
                  ),
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    debounceTimer?.cancel();
    super.dispose();
  }
}
