import 'dart:math';

import 'package:digital_glass_clock/flake.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SnowyBackground extends StatefulWidget {
  @override
  _SnowyBackgroundState createState() => _SnowyBackgroundState();
}

class _SnowyBackgroundState extends State<SnowyBackground> {
  Size size;
  initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      size = MediaQuery.of(context).size;
    });
    super.initState();
  }

  List<Flake> buildSnow() {
    Random rng = Random();
    List<Flake> drops = [];
    if (size == null) return drops;
    for (int i = 0; i < 200; i++) {
      drops.add(
        Flake(
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
        ...buildSnow()
      ],
    );
  }
}
