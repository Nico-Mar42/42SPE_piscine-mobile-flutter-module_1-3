import 'package:flutter/material.dart';
import '../../../class/location_class.dart';


class NameText extends StatelessWidget {
  final Location loc;

  const NameText({
    super.key,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
        loc.cityName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.04
              : MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 166, 177),
          ),
        ),
          Text(
        "${loc.regionName}, ${loc.countryName}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.03
              : MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        //   Text(
        // loc.countryName,
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontSize: MediaQuery.of(context).orientation == Orientation.portrait
        //       ? MediaQuery.of(context).size.height * 0.05
        //       : MediaQuery.of(context).size.width * 0.05,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black87,
        //   ),
        // ),
        ]
      )
    );
  }
}