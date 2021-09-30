part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoadedState({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {}
