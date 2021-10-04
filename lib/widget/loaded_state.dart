import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/mytheme_view_model.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:flutter_bloc_weather_app/widget/background_color.dart';
import 'package:flutter_bloc_weather_app/widget/last_update.dart';
import 'package:flutter_bloc_weather_app/widget/location.dart';
import 'package:flutter_bloc_weather_app/widget/max_min_heat.dart';
import 'package:flutter_bloc_weather_app/widget/weather_image.dart';
import 'package:provider/provider.dart';

class LoadedState extends StatefulWidget {
  const LoadedState({Key? key}) : super(key: key);

  @override
  _LoadedStateState createState() => _LoadedStateState();
}

class _LoadedStateState extends State<LoadedState> {
  Completer<void>? _refreshCompleter;
  WeatherViewModel? _weatherViewModel;
  MyThemeViewModel? _myThemeViewModel;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var weatherStateAbbr = _weatherViewModel!.getWeatherStateAbbr();
      _myThemeViewModel!.changeTheme(weatherStateAbbr);
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshCompleter!.complete();
    _refreshCompleter = Completer<void>();
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    return BackgroundColorWidget(
      color: Provider.of<MyThemeViewModel>(context).myTheme.materialColor,
      child: RefreshIndicator(
        onRefresh: () {
          _weatherViewModel!
              .refreshWeather(_weatherViewModel!.responseWeather.title);
          return _refreshCompleter!.future;
        },
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
