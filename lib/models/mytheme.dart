import 'package:flutter/material.dart';

class MyTheme {
  MaterialColor _materialColor;
  ThemeData _themeData;

  MaterialColor get materialColor => _materialColor;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData value) {
    _themeData = value;
  }

  set materialColor(MaterialColor value) {
    _materialColor = value;
  }

  MyTheme(this._themeData, this._materialColor);
}
