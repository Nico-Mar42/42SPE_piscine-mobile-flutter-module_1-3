import 'package:flutter/material.dart';
import '../../class/location_class.dart';
import 'text_bloc/name_bloc.dart';
import 'text_bloc/week_bloc.dart';
class WeatherPageWeekly extends StatefulWidget {
  const WeatherPageWeekly({super.key, required this.location});

  final Location location;

  @override
  State<WeatherPageWeekly> createState() => _WeatherPageWeeklyState();
}

class _WeatherPageWeeklyState extends State<WeatherPageWeekly> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      alignment: Alignment.center,
      child: SingleChildScrollView( 
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.22
              : MediaQuery.of(context).size.height * 0.22,
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ajouter cette ligne
        children: [
          if ((widget.location.isGeolocated || widget.location.isFromSearch) &&
               widget.location.cityNotFound == false && 
                widget.location.apiError == false) ...[
            NameText(loc: widget.location),
            WeekBloc(loc: widget.location)
            
          ] else ...[
            Center(
              child: Text(
                widget.location.apiError == false
                  ? widget.location.cityNotFound == false
                    ? "Geolocation is not available, please enable it in your App settings."
                    : "Could not find any result for the supplied address or coordinates."
                  : "The service connection is lost, please check your internet connection or try again",
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
