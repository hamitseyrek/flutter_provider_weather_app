import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/data/weather_repository.dart';

part 'thema_event.dart';
part 'thema_state.dart';

class ThemaBloc extends Bloc<ThemaEvent, ThemaState> {
  ThemaBloc()
      : super(ThemaAppState(
            themeData: ThemeData.dark(), materialColor: Colors.purple));

  @override
  ThemaState get initialState =>
      ThemaAppState(themeData: ThemeData.dark(), materialColor: Colors.purple);

  @override
  Stream<ThemaState> mapEventToState(ThemaEvent event) async* {
    ThemaAppState? themaAppState;
    if (event is ChangeThema) {
      switch (event.weatherStateAbbr) {
        case 'sn':
        case 'sl':
        case 'h':
        case 't':
        case 'hc':
          themaAppState = ThemaAppState(
              themeData: ThemeData(primaryColor: Colors.blueGrey),
              materialColor: Colors.grey);
          break;
        case 'hr':
        case 'lr':
        case 's':
          themaAppState = ThemaAppState(
              themeData: ThemeData(primaryColor: Colors.indigoAccent),
              materialColor: Colors.indigo);
          break;

        case 'lc':
        case 'c':
          themaAppState = ThemaAppState(
              themeData: ThemeData(primaryColor: Colors.yellow),
              materialColor: Colors.orange);
          break;
      }
      yield themaAppState!;
    }
  }
}
