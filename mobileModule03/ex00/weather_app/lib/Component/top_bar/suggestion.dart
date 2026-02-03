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
    if(widget.suggestion.locationList[0].cityName == "" || widget.searchController.text.isEmpty ) {
      return const SizedBox.shrink();
    }
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        constraints: const BoxConstraints(maxHeight: 205),
        child: ListView.builder(
          itemExtent: 40,
          itemCount: widget.suggestion.locationList.length,
          itemBuilder: (context, index) {
            final location = widget.suggestion.locationList[index];
            return GestureDetector(
              onTap: () {
                widget.updateLocationState(location);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1.5,
                    ),
                  ),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                  child: Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.grey[600]),
                      Padding(padding:  const EdgeInsets.only(right: 8)), 
                      Text(
                        location.cityName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        location.cityName.isNotEmpty
                            ? " ${location.regionName}, ${location.countryName}"
                            : "",
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
              ),
              ),
            );
          },
        ),
      ),
    );
  }
}
