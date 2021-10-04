import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/locator.dart';
import 'package:flutter_bloc_weather_app/viewmodel/mytheme_view_model.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:flutter_bloc_weather_app/widget/weather_app.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(ChangeNotifierProvider<MyThemeViewModel>(
      create: (context) => MyThemeViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (context, myThemeViewModel, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myThemeViewModel.myTheme.themeData,
        color: myThemeViewModel.myTheme.materialColor,
        home: ChangeNotifierProvider<WeatherViewModel>(
            create: (context) => locator<WeatherViewModel>(),
            child: WeatherApp()),
      ),
    );
  }
}
