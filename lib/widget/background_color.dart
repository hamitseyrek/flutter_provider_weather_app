import 'package:flutter/material.dart';

class BackgroundColorWidget extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  // ignore: use_key_in_widget_constructors
  const BackgroundColorWidget({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color, color.withAlpha(500), color.withAlpha(150)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7, 1]),
      ),
    );
  }
}
