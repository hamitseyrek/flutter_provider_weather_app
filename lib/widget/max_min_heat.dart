import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather_app/blocs/weather/bloc/weather_bloc.dart';

class MaxMinHeatWidget extends StatelessWidget {
  const MaxMinHeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        var responseMinDate = (state as WeatherLoadedState)
            .weatherModel
            .consolidatedWeather[0]
            .minTemp
            .floor();
        var responseMaxDate =
            (state).weatherModel.consolidatedWeather[0].maxTemp.floor();
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
      },
    );
  }
}
