import 'package:flutter/material.dart';
import '../../class/location_class.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.location, required this.title});

  final String title;
  final Location location;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  

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
              Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.location.isFromSearch == false
                    ?"${widget.location.latitude.toString()}\n${widget.location.longitude.toString()}°"
                    : "${widget.location.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.location.latitude.toString().length <= 25
                        ? MediaQuery.of(context).size.height * 0.08
                        : MediaQuery.of(context).size.height * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              
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
      ),
    );
  }
}
