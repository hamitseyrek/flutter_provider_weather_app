import 'package:flutter_bloc_weather_app/data/weather_api_client.dart';
import 'package:flutter_bloc_weather_app/data/weather_repository.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
