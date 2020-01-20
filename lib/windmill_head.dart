import 'package:digital_glass_clock/blade_painter.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WindMillHead extends StatelessWidget {
  WindMillHead({this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    double centerSize = size * .1;
    double bladeSize = (size - centerSize) / 2;

    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
            top: 0,
            left: size / 2 - size / 40,
            child: Container(
              child: Transform.rotate(
                  angle: math.pi * 0,
                  child: CustomPaint(
                      size: Size(bladeSize / 10, bladeSize),
                      painter: MillBladePainter())),
            )),
        Positioned(
            top: 0,
            left: size / 2 - size / 40,
            child: Container(
              child: Transform.rotate(
                  origin: Offset(0, (size + centerSize) / 4),
                  angle: math.pi * .5,
                  child: CustomPaint(
                      size: Size(bladeSize / 10, bladeSize),
                      painter: MillBladePainter())),
            )),
        Positioned(
            top: 0,
            left: size / 2 - size / 40,
            child: Container(
              child: Transform.rotate(
                  origin: Offset(0, (size + centerSize) / 4),
                  angle: math.pi,
                  child: CustomPaint(
                      size: Size(bladeSize / 10, bladeSize),
                      painter: MillBladePainter())),
            )),
        Positioned(
            top: 0,
            left: size / 2 - size / 40,
            child: Container(
              child: Transform.rotate(
                  origin: Offset(0, (size + centerSize) / 4),
                  angle: math.pi * 1.5,
                  child: CustomPaint(
                      size: Size(bladeSize / 10, bladeSize),
                      painter: MillBladePainter())),
            )),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: centerSize,
            height: centerSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(centerSize / 2),
                gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1,
                    colors: [
                      Colors.white,
                      Colors.grey,
                    ])),
          ),
        ),
      ],
    );
  }
}
