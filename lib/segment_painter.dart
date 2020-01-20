import 'package:digital_glass_clock/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SegmentPainter extends CustomPainter {
  SegmentPainter({@required this.axis, @required this.color});

  final Color color;
  final Axis axis;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path;
    if (axis == Axis.horizontal) {
      path = _getHorizontalPath(size);
    } else {
      path = _getVerticalPath(size);
    }
    canvas.drawPath(path, paint);
  }

  Path _getHorizontalPath(Size size) {
    Path path = Path();
    double angleInRadians = Utils.degreesToRadians(45);
    double triangleHeight = size.height / 2 * math.tan(angleInRadians);
    path.moveTo(0, size.height / 2);
    path.lineTo(triangleHeight, size.height);
    path.lineTo(size.width - triangleHeight, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - triangleHeight, 0);
    path.lineTo(triangleHeight, 0);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  _getVerticalPath(Size size) {
    Path path = Path();
    double angleInRadians = Utils.degreesToRadians(45);
    double triangleHeight = size.width / 2 * math.tan(angleInRadians);
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, triangleHeight);
    path.lineTo(size.width, size.height - triangleHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height - triangleHeight);
    path.lineTo(0, triangleHeight);
    path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(SegmentPainter oldDelegate) {
    return oldDelegate.color != this.color;
  }

  @override
  bool shouldRebuildSemantics(SegmentPainter oldDelegate) => false;
}
