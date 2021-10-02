part of 'thema_bloc.dart';

abstract class ThemaState extends Equatable {
  const ThemaState([List props = const []]);

  @override
  List<Object> get props => [];
}

class ThemaInitial extends ThemaState {}

class ThemaAppState extends ThemaState {
  final ThemeData themeData;
  final MaterialColor materialColor;

  ThemaAppState({required this.themeData, required this.materialColor})
      : super([themeData, materialColor]);
}
