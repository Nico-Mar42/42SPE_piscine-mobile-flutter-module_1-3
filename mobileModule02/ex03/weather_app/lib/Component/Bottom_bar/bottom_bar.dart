import 'package:flutter/material.dart';
import 'Page_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.amber[100],
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.22
          : MediaQuery.of(context).size.height * 0.22,
      child: TabBar(
        tabs: [
          pageButton(title: "Currently", iconName: "watch_later_outlined"),
          pageButton(title: "Today", iconName: "today"),
          pageButton(title: "Weekly", iconName: "calendar_view_week"),
        ],
      ),
    );
  }
}
