part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const []]); // : super(props);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent({required this.cityName}) : super([cityName]);
}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  RefreshWeatherEvent({required this.cityName}) : super([cityName]);
}
