import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/models/mytheme.dart';

class MyThemeViewModel with ChangeNotifier {
  MyTheme _myTheme = MyTheme(
      themeData: ThemeData(primaryColor: Colors.green),
      materialColor: Colors.amber);
  MyThemeViewModel() {
    _myTheme;
  }

  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void changeTheme(String weatherStateAbbr) {
    switch (weatherStateAbbr) {
      case 'sn':
      case 'sl':
      case 'h':
      case 't':
      case 'hc':
        _myTheme = MyTheme(
            themeData: ThemeData(primaryColor: Colors.green),
            materialColor: Colors.grey);
        break;
      case 'hr':
      case 'lr':
      case 's':
        _myTheme = MyTheme(
            themeData: ThemeData(primaryColor: Colors.indigoAccent),
            materialColor: Colors.indigo);
        break;
      case 'lc':
      case 'c':
        _myTheme = MyTheme(
            themeData: ThemeData(primaryColor: Colors.grey),
            materialColor: Colors.orange);
        break;
    }
    myTheme = _myTheme;
  }
}
