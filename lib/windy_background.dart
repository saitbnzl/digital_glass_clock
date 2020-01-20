import 'package:digital_glass_clock/wind_mill.dart';
import 'package:digital_glass_clock/windmill_head.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WindyBackground extends StatefulWidget {
  @override
  _WindyBackgroundState createState() => _WindyBackgroundState();
}

class _WindyBackgroundState extends State<WindyBackground> {
  double windPos = 0;

  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.lightBlueAccent,
        ),
        Align(alignment: Alignment(1, 1), child: WindMill()),
        Align(alignment: Alignment(0, 1), child: WindMill()),
        Align(alignment: Alignment(-1, 1), child: WindMill()),
        if (Theme.of(context).brightness == Brightness.light)
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white.withOpacity(.4),
                  Colors.transparent,
                ])),
          )
      ],
    );
  }
}
