//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({
    super.key,
    required this.onSearch
    });

    final Function(String)? onSearch;

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
          widget.onSearch?.call(searchController.text);
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

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.zero,
      width: 1.5,
      height: MediaQuery.of(context).size.height * 0.07,
      color: Colors.black,
    );
  }
}


class LocalisationButton extends StatelessWidget {
  const LocalisationButton({
    super.key,
    required this.locateMe,
    });

    final Function()? locateMe;

    void onPressed(){
      locateMe?.call();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
        
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation : WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Icon(Icons.near_me,
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.05,
        )
      ),
    );
  }
}