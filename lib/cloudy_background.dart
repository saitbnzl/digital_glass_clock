import 'dart:math';

import 'package:digital_glass_clock/cloud_painter.dart';
import 'package:flutter/material.dart';

class CloudyBackground extends StatefulWidget {
  @override
  _CloudyBackgroundState createState() => _CloudyBackgroundState();
}

class _CloudyBackgroundState extends State<CloudyBackground> {
  initState() {
    super.initState();
  }

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
          child: RepaintBoundary(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  left: 0,
                  top: 0,
                  child: CustomPaint(
                    painter:
                        CloudPainter(color: Colors.grey[300].withAlpha(50)),
                  ),
                ),
              ],
            ),
          ),
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
          )
      ],
    );
  }
}
