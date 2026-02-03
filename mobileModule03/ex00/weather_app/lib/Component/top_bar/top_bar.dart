import 'package:flutter/material.dart';
import 'search_tab.dart';
import 'vertical_separator.dart';
import 'localisation_button.dart';
import '../../class/location_class.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    super.key,
    required this.location,
    required this.updateLocationState,
    required this.locateMeState,
    required this.searchController,
     required this.searchFocusNode,
  });

  final Location location;
  final Function updateLocationState;
  final Function locateMeState;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber[400],
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,

      flexibleSpace: SafeArea(
        child: TabBar(
          // isScrollable: true,
          labelPadding: EdgeInsets.zero,
          tabAlignment: TabAlignment.center,
          indicatorColor: Colors.transparent,
          tabs: [
            SearchTab(
              location: location,
              updateLocationState: updateLocationState,
              searchController: searchController,
              searchFocusNode: searchFocusNode
            ),
            VerticalSeparator(),
            LocalisationButton(
              location: location,
              locateMeState: locateMeState,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(10 + 48.0);
}
