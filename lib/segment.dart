import 'package:digital_glass_clock/segment_painter.dart';
import 'package:flutter/material.dart';

class Segment extends StatelessWidget {
  Segment({@required this.size, @required this.axis, this.color: Colors.black});

  final Size size;
  final Axis axis;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: SegmentPainter(color: color, axis: axis),
      ),
    );
  }
}
