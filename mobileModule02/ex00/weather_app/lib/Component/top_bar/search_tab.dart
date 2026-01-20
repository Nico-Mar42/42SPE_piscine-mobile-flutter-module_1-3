import 'package:flutter/material.dart';
import '../../class/location_class.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({
    super.key,
    required this.location,
    required this.updateLocationState,
    });

    final Location location;
    final Function updateLocationState;
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // 50% de la largeur
      margin: EdgeInsets.zero,
      child: SearchBar(
        controller: searchController,
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation : WidgetStatePropertyAll(0),
        hintText: 'Search location',
        leading: const Icon(Icons.search),
        onSubmitted: (value) {
          widget.updateLocationState( searchController.text);
        },
    ),
  );
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}