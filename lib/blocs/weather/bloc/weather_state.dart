part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  WeatherState();
}

class WeatherInitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {
  @override
  List<Object> get props => [];
}
