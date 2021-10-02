import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_weather_app/data/weather_repository.dart';
import 'package:flutter_bloc_weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitialState());

  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        // get weather state
        final comingWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weatherModel: comingWeather);
      } catch (e) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        // get weather state
        final comingWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weatherModel: comingWeather);
      } catch (e) {
        yield state;
      }
    }
  }
}
