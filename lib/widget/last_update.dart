import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather_app/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var responseDate =
        DateTime.parse(_weatherViewModel.responseWeather.time).toLocal();
    return Text(
      'Last update: ' + TimeOfDay.fromDateTime(responseDate).format(context),
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}
