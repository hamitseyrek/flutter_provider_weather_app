part of 'thema_bloc.dart';

abstract class ThemaState extends Equatable {
  ThemaState();
}

class ThemaAppState extends ThemaState {
  final ThemeData themeData;
  final MaterialColor materialColor;
  ThemaAppState({required this.themeData, required this.materialColor});
  @override
  List<Object> get props => [themeData, materialColor];
}
