import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/widget/last_update.dart';
import 'package:flutter_bloc_weather_app/widget/location.dart';
import 'package:flutter_bloc_weather_app/widget/max_min_heat.dart';
import 'package:flutter_bloc_weather_app/widget/weather_image.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Center(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LocationWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LastUpdateWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: WeatherImageWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(child: MaxMinHeatWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
