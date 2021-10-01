import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather_app/blocs/weather/bloc/weather_bloc.dart';
import 'package:flutter_bloc_weather_app/widget/last_update.dart';
import 'package:flutter_bloc_weather_app/widget/location.dart';
import 'package:flutter_bloc_weather_app/widget/max_min_heat.dart';
import 'package:flutter_bloc_weather_app/widget/select_city.dart';
import 'package:flutter_bloc_weather_app/widget/weather_image.dart';

class WeatherApp extends StatelessWidget {
  String _selectedCity = 'Ankara';

  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              _selectedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectCityWidget()));
              if (_selectedCity.isNotEmpty) {
                _weatherBloc.add(FetchWeatherEvent(cityName: _selectedCity));
              } else {}
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitialState) {
              return const Center(child: Text('Please select city'));
            } else if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              final responseWeather = state.weatherModel;
              responseWeather.consolidatedWeather[0].maxTemp;
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: LocationWidget(selectedCity: _selectedCity)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: LastUpdateWidget()),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: WeatherImageWidget()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(
                        child: Text(responseWeather
                            .consolidatedWeather[0].maxTemp
                            .toString())),
                  ),
                ],
              );
            } else {
              return Text('e');
            }
          },
        ),
      ),
    );
  }
}
