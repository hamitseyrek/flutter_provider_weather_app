import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/mytheme_view_model.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:flutter_bloc_weather_app/widget/last_update.dart';
import 'package:flutter_bloc_weather_app/widget/location.dart';
import 'package:flutter_bloc_weather_app/widget/max_min_heat.dart';
import 'package:flutter_bloc_weather_app/widget/select_city.dart';
import 'package:flutter_bloc_weather_app/widget/weather_image.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String _selectedCity = 'Ankara';
  Completer<void> _refreshCompleter = Completer<Void>();
  WeatherViewModel? _weatherViewModel;

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
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
                _weatherViewModel.getWeather(_selectedCity);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child:
            (_weatherViewModel.weatherState == WeatherState.weatherLoadedState)
                ? loadedState(context)
                : (_weatherViewModel.weatherState ==
                        WeatherState.weatherLoadingState)
                    ? loadingState()
                    : (_weatherViewModel.weatherState ==
                            WeatherState.weatherErrorState)
                        ? errorState()
                        : initialState(),
      ),
    );
  }

  Widget loadedState(BuildContext context) {
    /*var weatherStateAbbr = Provider.of<WeatherViewModel>(context)
        .responseWeather
        .consolidatedWeather[0]
        .weatherStateAbbr;
    Provider.of<MyThemeViewModel>(context).ChangeTheme(weatherStateAbbr);*/

    return RefreshIndicator(
      onRefresh: () {
        _weatherViewModel!.getWeather(_selectedCity);
        return _refreshCompleter.future;
      },
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
    );
  }

  initialState() {
    return const Text('Please select city');
  }

  loadingState() {
    return const CircularProgressIndicator();
  }

  errorState() {
    return const Text('Error');
  }
}
