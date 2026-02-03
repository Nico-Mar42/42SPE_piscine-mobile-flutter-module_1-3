import 'package:flutter/material.dart';
import '../../class/location_class.dart';
import 'text_bloc/name_bloc.dart';
import 'text_bloc/current_bloc.dart';

class WeatherPageCurrent extends StatefulWidget {
  const WeatherPageCurrent({super.key, required this.location});

  final Location location;

  @override
  State<WeatherPageCurrent> createState() => _WeatherPageCurrentState();
}

class _WeatherPageCurrentState extends State<WeatherPageCurrent> {
  @override
  Widget build(BuildContext context) {
    // if (widget.location.cityName == "") {
    //   return Center(
    //     child:SizedBox(
    //       width: 50,
    //       height: 50,
    //       child: CircularProgressIndicator(
    //         backgroundColor: Colors.transparent,
    //         strokeWidth: 4,
    //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    //       ),
    //     ),
    //   );
    // }

    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[100],

        image: DecorationImage(
          image: AssetImage('asset/images/weather_icon.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      alignment: Alignment.center,
      

      child: widget.location.cityName == ""
          ? SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Ajouter cette ligne
          children: [
            if ((widget.location.isGeolocated ||
                    widget.location.isFromSearch) &&
                widget.location.cityNotFound == false &&
                widget.location.apiError == false) ...[
              NameText(loc: widget.location),
              Padding(
                padding: EdgeInsets.only(
                  bottom:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.05
                      : MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              CurrentBloc(loc: widget.location),
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
      ),
    );
  }
}
