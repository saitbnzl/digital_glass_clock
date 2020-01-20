import 'package:flutter/material.dart';

class MillBladePainter extends CustomPainter {
  Paint _paint;
  final Color color;
  MillBladePainter({this.color}) {
    _paint = Paint()
      ..color = color ?? Color(0xffdedede)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var innerPath = Path();
    innerPath.moveTo(0, size.height);
    innerPath.lineTo(size.width, size.height);
    innerPath.lineTo(size.width / 2, 0);
    innerPath.lineTo(0, size.height);
    innerPath.close();
    canvas.drawPath(innerPath, _paint);
    var outerPath = Path();
    Paint _paintOuter = Paint()
      ..color = Color(0xffc0c0c0c0)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    outerPath.moveTo(0, size.height);
    outerPath.lineTo(size.width, size.height);
    outerPath.lineTo(size.width / 2, 0);
    outerPath.lineTo(0, size.height);
    canvas.drawPath(outerPath, _paintOuter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
