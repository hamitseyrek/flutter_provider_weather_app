import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last update: ' + TimeOfDay(hour: 20, minute: 35).format(context),
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}
