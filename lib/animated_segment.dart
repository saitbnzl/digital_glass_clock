import 'package:digital_glass_clock/segment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedSegment extends StatelessWidget {
  const AnimatedSegment({
    Key key,
    @required this.size,
    @required this.axis,
    this.offOpacity: 0.2,
    this.onOpacity: 1.0,
    this.color: Colors.white,
    this.isOn: false,
    Curve curve = Curves.linear,
    @required this.duration,
  });

  final Size size;
  final Axis axis;
  final bool isOn;
  final double offOpacity;
  final double onOpacity;
  final Duration duration;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: isOn ? onOpacity : offOpacity,
      child: Segment(
        color: color,
        size: size,
        axis: axis,
      ),
    );
  }
}
