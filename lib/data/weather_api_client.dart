import 'dart:convert';

import 'package:flutter_bloc_weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/';
  final http.Client httpClient = http.Client();

  Future<int> getCityId(String cityName) async {
    final cityURL = baseUrl + '/api/location/search/?query=' + cityName;
    final cityID = await httpClient.get(Uri.dataFromString(cityURL));

    if (cityID.statusCode != 200) {
      throw Exception('Data can not give');
    }

    final cityIDJSOM = (jsonDecode(cityID.body)) as List;
    return cityIDJSOM[0]['woeid'];
  }

  Future<WeatherModel> getWeather(int cityID) async {
    final weatherURL = baseUrl + '/api/location/' + cityID.toString();
    final responseWeather =
        await httpClient.get(Uri.dataFromString(weatherURL));

    if (responseWeather.statusCode != 200) {
      throw Exception('Weather can not give');
    }

    final responseWeatherJSOM = jsonDecode(responseWeather.body);
    return WeatherModel.fromJson(responseWeatherJSOM);
  }
}
