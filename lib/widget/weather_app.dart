import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/mytheme_view_model.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:flutter_bloc_weather_app/widget/loaded_state.dart';
import 'package:flutter_bloc_weather_app/widget/select_city.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String _selectedCity = 'Ankara';
  WeatherViewModel? _weatherViewModel;

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor:
            Provider.of<MyThemeViewModel>(context).myTheme.materialColor,
        actions: [
          IconButton(
              onPressed: () async {
                _selectedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectCityWidget()));
                _weatherViewModel!.getWeather(_selectedCity);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child:
            (_weatherViewModel!.weatherState == WeatherState.weatherLoadedState)
                ? const LoadedState()
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
