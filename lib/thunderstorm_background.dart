import 'package:digital_glass_clock/lightning_painter.dart';
import 'package:digital_glass_clock/rainy_background.dart';
import 'package:flutter/material.dart';

class ThunderStormBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.lightBlueAccent,
        ),
        RainyBackogrund(),
        if (Theme.of(context).brightness == Brightness.light)
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white.withOpacity(.3),
                  Colors.transparent,
                ])),
          ),
        Positioned.fill(child: RepaintBoundary(child: PeriodicLightning()))
      ],
    );
  }
}
