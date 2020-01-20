import 'dart:math';

import 'package:digital_glass_clock/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CloudPainter extends CustomPainter {
  CloudPainter({@required this.color = Colors.white});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = color;
    makeCloud(
        canvas, paint, size, path, 50, 50, size.width / 10, size.width / 4);
    makeCloud(canvas, paint, size, path, size.width * .5, size.height * .15,
        size.width / 10, size.width / 4);
    makeCloud(canvas, paint, size, path, size.width * .7, size.height * .15,
        size.width / 10, size.width / 4);
  }

  Path makeCloud(
      Canvas canvas, Paint paint, size, Path path, xLast, yLast, rLast, lLast) {
    Random rng = Random();

    rLast = rLast ?? 50;
    lLast = lLast ?? rng.nextDouble() * 25 + 75;
    var x = (xLast ?? 250) + rng.nextDouble() * (2 * rLast) - rLast / 1,
        y = (yLast ?? 250) + rng.nextDouble() * (1 * rLast) - rLast / 1.5,
        r = (rLast) + rng.nextDouble() * 10 - 7.5,
        l = (lLast);

    if (x - r < 0)
      x = r + 1;
    else if (x + r > size.width) x = size.width - r - 1;
    if (y - r < 0)
      y = r + 1;
    else if (y + r > size.height) y = size.height - r - 1;
    if (r <= 0) return path;
    if (l < 0)
      l = 0;
    else if (l > 100) l = 100;
    path.addArc(
        Rect.fromCircle(center: Offset(x, y), radius: r), 0.0, math.pi * 2);
    canvas.drawPath(path, paint);
    if (rng.nextDouble() < 0.01) return path;
    this.makeCloud(canvas, paint, size, path, x, y, r, l);
    return path;
  }

  @override
  bool shouldRepaint(CloudPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(CloudPainter oldDelegate) => false;
}
