import 'package:flutter/material.dart';


class WeatherCurrently extends StatefulWidget {
  const WeatherCurrently({
    super.key,
    this.location = "",
    });
  
  final String location ; 

  @override
  State<WeatherCurrently> createState() => _WeatherCurrentlyState();
}

class _WeatherCurrentlyState extends State<WeatherCurrently> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.amber[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Ajouter cette ligne
        children: [
          Center(
            child: Text(
              'Currently',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.08,
                
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          ),
          Center(
            child: Text(
              widget.location,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.location.length <= 25 
                      ? MediaQuery.of(context).size.height * 0.08
                      : MediaQuery.of(context).size.height * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          )
        ],
      )
    );
  }
}

class WeatherToday extends StatefulWidget {
  const WeatherToday({
    super.key,
    this.location = "",
    });
  
  final String location ; 

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  @override
  Widget build(BuildContext context) {
     return  Container(
      color: Colors.amber[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Ajouter cette ligne

        children: [
          Center(
            child: Text(
              'Today',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          ),
          Center(
            child: Text(
              widget.location,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.location.length <= 25 
                      ? MediaQuery.of(context).size.height * 0.08
                      : MediaQuery.of(context).size.height * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          )
        ],
      )
    );
  }
}

class WeatherWeekly extends StatefulWidget {
  const WeatherWeekly({
    super.key,
    this.location = "",
    });
  
  final String location ; 

  @override
  State<WeatherWeekly> createState() => _WeatherWeeklyState();
}

class _WeatherWeeklyState extends State<WeatherWeekly> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.amber[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Ajouter cette ligne
        children: [
          Center(
            child: Text(
              'Weekly',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          ),
          Center(
            child: Text(
              widget.location,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.location.length <= 25 
                      ? MediaQuery.of(context).size.height * 0.08
                      : MediaQuery.of(context).size.height * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
          )
        ],
      )
    );
  }
}