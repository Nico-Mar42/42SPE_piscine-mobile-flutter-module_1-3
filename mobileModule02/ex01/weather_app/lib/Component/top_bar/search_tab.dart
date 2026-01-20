import 'package:flutter/material.dart';
import '../../class/location_class.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({
    super.key,
    required this.location,
    required this.updateLocationState,
    required this.searchController,
    required this.searchFocusNode,
  });

  final Location location;
  final Function updateLocationState;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // 50% de la largeur
      // height: 50,
      margin: EdgeInsets.zero,
      child: SearchBar(
        controller: widget.searchController,
        focusNode: widget.searchFocusNode,
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStatePropertyAll(0),
        hintText: 'Search location',
        leading: const Icon(Icons.search),
        onSubmitted: (value) {
          widget.updateLocationState(widget.searchController.text);
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }
}
