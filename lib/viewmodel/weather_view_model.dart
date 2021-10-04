import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/data/weather_repository.dart';
import 'package:flutter_bloc_weather_app/locator.dart';
import 'package:flutter_bloc_weather_app/models/weather_model.dart';

enum WeatherState {
  initialWeatherState,
  weatherLoadingState,
  weatherLoadedState,
  weatherErrorState
}

class WeatherViewModel with ChangeNotifier {
  WeatherState? _weatherState;
  final WeatherRepository _weatherRepository = locator<WeatherRepository>();
  WeatherModel? _responseWeather;

  WeatherViewModel() {
    _weatherState = WeatherState.initialWeatherState;
  }

  WeatherState get weatherState => _weatherState!;
  set weatherState(WeatherState value) {
    _weatherState = value;
    notifyListeners();
  }

  WeatherModel get responseWeather => _responseWeather!;

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      weatherState = WeatherState.weatherLoadingState;
      _responseWeather = await _weatherRepository.getWeather(cityName);
      weatherState = WeatherState.weatherLoadedState;
    } catch (e) {
      weatherState = WeatherState.weatherErrorState;
    }
    return _responseWeather!;
  }

  Future<WeatherModel> refreshWeather(String cityName) async {
    try {
      _responseWeather = await _weatherRepository.getWeather(cityName);
      weatherState = WeatherState.weatherLoadedState;
      // ignore: empty_catches
    } catch (e) {}
    return _responseWeather!;
  }

  String getWeatherStateAbbr() {
    return _responseWeather!.consolidatedWeather[0].weatherStateAbbr;
  }
}
