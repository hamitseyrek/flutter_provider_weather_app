import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var responseCityName = _weatherViewModel.responseWeather.title;
    return Text(
      responseCityName,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
