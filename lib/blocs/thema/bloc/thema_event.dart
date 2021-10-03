part of 'thema_bloc.dart';

abstract class ThemaEvent extends Equatable {
  const ThemaEvent([List props = const []]);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ChangeThema extends ThemaEvent {
  final String weatherStateAbbr;

  ChangeThema({required this.weatherStateAbbr}) : super([weatherStateAbbr]);
}
