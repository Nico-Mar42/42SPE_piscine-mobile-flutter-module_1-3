import 'package:flutter/material.dart';
import '../../class/search_location.dart';
import '../../class/location_class.dart';

class SuggestionList extends StatefulWidget {
  final SearchLocation suggestion;
  final TextEditingController searchController;
  final Function(Location) updateLocationState;

  const SuggestionList({
    super.key,
    required this.suggestion,
    required this.searchController,
    required this.updateLocationState,
  });

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        constraints: const BoxConstraints(maxHeight: 200),
        child: ListView.builder(
          itemExtent: 40,
          itemCount: widget.suggestion.locationList.length,
          itemBuilder: (context, index) {
            final location = widget.suggestion.locationList[index];
            return GestureDetector(
              onTap: () {
                widget.updateLocationState(location);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Text(location.cityName),
                    const SizedBox(width: 8),
                    Text(
                      location.cityName.isNotEmpty
                          ? " ${location.regionName}, ${location.countryName}"
                          : "",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
