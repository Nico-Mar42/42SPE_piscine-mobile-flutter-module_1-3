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
  bool isLoadingSuggestions = false;
  Timer? debounceTimer;

  void updateLocationSuggestion(Location loc) {
    setState(() {
      loc.actWeather.setWeatherClass(loc.longitude, loc.latitude);
      location = loc;

      suggestion.clearAllLocations();
      searchFocusNode.unfocus();
    });
  }

  void updateLocationState(String searchText) {
    setState(() async {
      location = await updateLocation(searchText);
      suggestion.clearAllLocations();
      searchFocusNode.unfocus();
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

    setState(() => isLoadingSuggestions = true);

    try {
      final result = await findsuggestion(searchtext);
      print(searchFocusNode);
      setState(() {
        suggestion = result;
        isLoadingSuggestions = false;
      });
    } catch (e) {
      print('Erreur : $e');
      setState(() => isLoadingSuggestions = false);
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
          body: Stack(
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
