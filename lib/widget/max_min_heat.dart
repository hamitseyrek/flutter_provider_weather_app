import 'package:flutter/material.dart';

class MaxMinHeatWidget extends StatelessWidget {
  const MaxMinHeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Max Heat: ' + 24.toString() + '°C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Min Heat: ' + 24.toString() + '°C',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
