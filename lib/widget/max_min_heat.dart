import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class MaxMinHeatWidget extends StatelessWidget {
  const MaxMinHeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var responseMinDate = _weatherViewModel
        .responseWeather.consolidatedWeather[0].minTemp
        .floor();
    var responseMaxDate = _weatherViewModel
        .responseWeather.consolidatedWeather[0].maxTemp
        .floor();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Max Heat: ' + responseMaxDate.toString() + '°C',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Min Heat: ' + responseMinDate.toString() + '°C',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
