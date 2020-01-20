import 'package:flutter/material.dart';
import 'dart:math' as math;

class CirclePainter extends CustomPainter {
  CirclePainter({this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    double smallSide = math.min(size.width, size.height);
    canvas.drawCircle(
        Offset(smallSide / 2, smallSide / 2), smallSide / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
