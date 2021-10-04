import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/locator.dart';
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
  Completer<void> _refreshCompleter = Completer<void>();
  WeatherViewModel? _weatherViewModel;
  MyThemeViewModel? _myThemeViewModel;

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = locator<WeatherViewModel>();
    _myThemeViewModel = locator<MyThemeViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                _selectedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectCityWidget()));
                _weatherViewModel!.getWeather(_selectedCity);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child:
            (_weatherViewModel!.weatherState == WeatherState.weatherLoadedState)
                ? loadedState(context)
                : (_weatherViewModel!.weatherState ==
                        WeatherState.weatherLoadingState)
                    ? loadingState()
                    : (_weatherViewModel!.weatherState ==
                            WeatherState.weatherErrorState)
                        ? errorState()
                        : initialState(),
      ),
    );
  }

  Widget loadedState(BuildContext context) {
    // Wait until the following return process is finished  and change the theme(1 second after).
    Future.delayed(const Duration(seconds: 1), () {
      var weatherStateAbbr = _weatherViewModel!.getWeatherStateAbbr();
      _myThemeViewModel!.ChangeTheme('s');
      //print(_selectedCity);
    });

    _refreshCompleter.complete();
    _refreshCompleter = Completer<void>();
    return RefreshIndicator(
      onRefresh: () {
        _weatherViewModel!.refreshWeather(_selectedCity);
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
