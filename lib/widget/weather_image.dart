import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var responseImage = _weatherViewModel
        .responseWeather.consolidatedWeather[0].weatherStateAbbr;
    var responseTemp = _weatherViewModel
        .responseWeather.consolidatedWeather[0].theTemp
        .floor();
    return Column(
      children: [
        Text(
          responseTemp.toString() + '°C',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Image.network(
          'https://www.metaweather.com/static/img/weather/png/' +
              responseImage.toString() +
              '.png',
          width: 150,
        ),
      ],
    );
  }
}
