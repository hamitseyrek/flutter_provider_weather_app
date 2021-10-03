import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/widget/last_update.dart';
import 'package:flutter_bloc_weather_app/widget/location.dart';
import 'package:flutter_bloc_weather_app/widget/max_min_heat.dart';
import 'package:flutter_bloc_weather_app/widget/select_city.dart';
import 'package:flutter_bloc_weather_app/widget/weather_image.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String _selectedCity = 'Ankara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                _selectedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectCityWidget()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(selectedCity: _selectedCity)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LastUpdateWidget()),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: WeatherImageWidget()),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(child: MaxMinHeatWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
