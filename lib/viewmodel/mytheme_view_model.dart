import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/models/mytheme.dart';

class MyThemeViewModel with ChangeNotifier {
  MyTheme _myTheme = MyTheme(ThemeData(primaryColor: Colors.green), Colors.red);
  MyThemeViewModel();

  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void ChangeTheme(String weatherStateAbbr) {
    switch (weatherStateAbbr) {
      case 'sn':
      case 'sl':
      case 'h':
      case 't':
      case 'hc':
        _myTheme = MyTheme(ThemeData(primaryColor: Colors.green), Colors.grey);
        break;
      case 'hr':
      case 'lr':
      case 's':
        _myTheme = MyTheme(
            ThemeData(primaryColor: Colors.indigoAccent), Colors.indigo);
        break;
      case 'lc':
      case 'c':
        _myTheme = MyTheme(ThemeData(primaryColor: Colors.grey), Colors.orange);
        break;
    }
    myTheme = _myTheme;
  }
}
