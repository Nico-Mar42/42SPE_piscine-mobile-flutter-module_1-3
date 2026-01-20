import 'package:flutter/material.dart';


class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.zero,
      width: 1.5,
      height: MediaQuery.of(context).size.height * 0.1 * 0.5,
      color: Colors.black,
    );
  }
}


