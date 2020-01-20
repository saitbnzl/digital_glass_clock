import 'package:flutter/material.dart';
import 'dart:math' as math;

class RaindropPainter extends CustomPainter {
  RaindropPainter(this.length, {this.color = Colors.white});
  final Color color;
  final double length;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    paint.strokeWidth = 2;
    canvas.drawLine(Offset(0, 0), Offset(0, length), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
