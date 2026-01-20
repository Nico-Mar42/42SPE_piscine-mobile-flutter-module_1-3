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
  });

  final Location location;
  final Function updateLocationState;
  final Function locateMeState;

  @override
  Widget build(BuildContext context) { 
    return AppBar(
      backgroundColor: Colors.amber[400],
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      bottom: TabBar(
        labelPadding: EdgeInsets.zero,
        tabAlignment: TabAlignment.center,
        indicatorColor: Colors.transparent,
        tabs: [
          SearchTab(location: location, updateLocationState: updateLocationState),
          VerticalSeparator(),
          LocalisationButton(location: location, locateMeState: locateMeState),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(10 + 48.0);
}
