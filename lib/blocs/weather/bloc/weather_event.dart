part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const []]); // : super(props);
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent({required this.cityName}) : super([cityName]);

  @override
  List<Object?> get props => throw UnimplementedError();
}
