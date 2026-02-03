import 'package:flutter/material.dart';
import '../../class/location_class.dart';

class LocalisationButton extends StatefulWidget {
  const LocalisationButton({
    super.key,
    required this.location,
    required this.locateMeState,
  });

  final Location location;
  final Function locateMeState;

  @override
  State<LocalisationButton> createState() => _LocalisationButtonState();
}

class _LocalisationButtonState extends State<LocalisationButton> {
  void onPressed() async {
    await widget.locateMeState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width * 0.18
        : MediaQuery.of(context).size.height * 0.18,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          elevation: WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Icon(
          Icons.near_me,
          color: Colors.white,
          size: MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * 0.05
        : MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    );
  }
}
