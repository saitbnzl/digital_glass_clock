import 'dart:math';

import 'package:digital_glass_clock/raindrop.dart';
import 'package:digital_glass_clock/raindrop_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RainyBackogrund extends StatefulWidget {
  @override
  _RainyBackogrundState createState() => _RainyBackogrundState();
}

class _RainyBackogrundState extends State<RainyBackogrund> {
  Size size;
  initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      size = MediaQuery.of(context).size;
    });
    super.initState();
  }

  List<RainDrop> buildRainDrops() {
    Random rng = Random();
    List<RainDrop> drops = [];
    if (size == null) return drops;
    for (int i = 0; i < 200; i++) {
      drops.add(
        RainDrop(
          screenSize: size,
          length: rng.nextDouble() * 5 + 3.0,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
              : Colors.white,
        ),
      );
    }
    return drops;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.lightBlueAccent,
        ),
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
          ),
        ...buildRainDrops()
      ],
    );
  }
}
