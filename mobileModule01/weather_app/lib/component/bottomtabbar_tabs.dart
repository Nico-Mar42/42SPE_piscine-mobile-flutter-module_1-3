import 'package:flutter/material.dart';


class Currently extends StatelessWidget {
  const Currently({super.key});

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
              "currently",
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

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.calendar_today_rounded,
              color: Colors.grey[600],
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Today",
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

class Weekly extends StatelessWidget {
  const Weekly({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.calendar_month_rounded,
              color: Colors.grey[600],
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Weekly",
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