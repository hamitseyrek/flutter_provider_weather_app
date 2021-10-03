import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/models/mytheme.dart';

class MyThemeViewModel with ChangeNotifier {
  MyTheme _myTheme = MyTheme(ThemeData.light(), Colors.red);
  MyThemeViewModel();

  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void ChangeTheme(String weatherStateAbbr) {
    MyTheme? theme;
    switch (weatherStateAbbr) {
      case 'sn':
      case 'sl':
      case 'h':
      case 't':
      case 'hc':
        theme = MyTheme(ThemeData(primaryColor: Colors.green), Colors.grey);
        break;
      case 'hr':
      case 'lr':
      case 's':
        theme = MyTheme(
            ThemeData(primaryColor: Colors.indigoAccent), Colors.indigo);
        break;
      case 'lc':
      case 'c':
        theme = MyTheme(ThemeData(primaryColor: Colors.yellow), Colors.orange);
        break;
    }
    myTheme = theme!;
  }
}
