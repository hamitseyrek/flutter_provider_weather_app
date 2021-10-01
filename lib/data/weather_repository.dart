import 'package:flutter_bloc_weather_app/data/weather_api_client.dart';
import 'package:flutter_bloc_weather_app/locator.dart';
import 'package:flutter_bloc_weather_app/models/weather_model.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<WeatherModel> getWeather(String cityName) async {
    final int cityID = await weatherApiClient.getCityID(cityName);
    return await weatherApiClient.getWeather(cityID);
  }
}
