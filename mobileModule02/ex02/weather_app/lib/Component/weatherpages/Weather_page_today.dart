import 'package:flutter/material.dart';
import '../../class/location_class.dart';
import 'text_bloc/name_bloc.dart';
import 'text_bloc/today_bloc.dart';
class WeatherPageToday extends StatefulWidget {
  const WeatherPageToday({super.key, required this.location});

  final Location location;

  @override
  State<WeatherPageToday> createState() => _WeatherPageTodayState();
}

class _WeatherPageTodayState extends State<WeatherPageToday> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      alignment: Alignment.center,
      child: SingleChildScrollView( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ajouter cette ligne
        children: [
          if (widget.location.isGeolocated || widget.location.isFromSearch) ...[
            NameText(loc: widget.location),
            TodayBloc(loc: widget.location)
            
          ] else ...[
            Center(
              child: Text(
                "Geolocation is not available, please enable it in your App settings.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 255, 0, 0),
                ),
              ),
            ),
          ],
        ],
      ),
      )
    );
  }
}
