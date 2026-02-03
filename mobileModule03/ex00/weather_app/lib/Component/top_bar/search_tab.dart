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
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.black, width: 1)),
      ),
      width: MediaQuery.of(context).size.width * 0.8, // 50% de la largeur
      // height: 50,
      margin: EdgeInsets.zero,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search location',
          floatingLabelStyle: TextStyle(fontSize: 22),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          prefixIcon: IconButton(
            onPressed: () {
              widget.updateLocationState(widget.searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
        ),
        controller: widget.searchController,
        focusNode: widget.searchFocusNode,

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
