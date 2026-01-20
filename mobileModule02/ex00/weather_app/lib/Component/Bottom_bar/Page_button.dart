import 'package:flutter/material.dart';


class pageButton extends StatelessWidget {
  const pageButton({
    super.key,
    required this.title,
    required this.iconName,
    });

  final String title;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.watch_later_outlined,
              color: Colors.grey[600],
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
                style: TextStyle(
                fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.022
                  : MediaQuery.of(context).size.width * 0.022,
                color: Colors.grey[600],
              )
            ),
          ),
        ],
      ),
    );
  }
}