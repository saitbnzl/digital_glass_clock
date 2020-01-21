import 'package:digital_glass_clock/animated_segment.dart';
import 'package:digital_glass_clock/segment_painter.dart';
import 'package:flutter/material.dart';

class SevenSegmentDisplay extends StatelessWidget {
  static const Map<String, List<int>> CHAR_MAPS = {
    "0": [1, 1, 1, 1, 1, 1, 0],
    "1": [0, 1, 1, 0, 0, 0, 0],
    "2": [1, 1, 0, 1, 1, 0, 1],
    "3": [1, 1, 1, 1, 0, 0, 1],
    "4": [0, 1, 1, 0, 0, 1, 1],
    "5": [1, 0, 1, 1, 0, 1, 1],
    "6": [1, 0, 1, 1, 1, 1, 1],
    "7": [1, 1, 1, 0, 0, 0, 0],
    "8": [1, 1, 1, 1, 1, 1, 1],
    "9": [1, 1, 1, 1, 0, 1, 1],
  };

  SevenSegmentDisplay(
      {this.displayMap: const [0, 0, 0, 0, 0, 0, 0],
      this.fadeAnimationDuration: const Duration(milliseconds: 300),
      this.offOpacity: 0.2,
      this.onOpacity: 1.0,
      this.color: Colors.black});

  final List<int> displayMap;
  final Duration fadeAnimationDuration;
  final double offOpacity;
  final double onOpacity;
  final Color color;

  static const double SEGMENT_HEIGHT = 60;
  static const double SEGMENT_WIDTH = 15;
  static const double SEGMENT_MARGIN = SEGMENT_WIDTH / 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (2 * SEGMENT_HEIGHT) + SEGMENT_WIDTH + (SEGMENT_MARGIN * 3),
      width: SEGMENT_HEIGHT + SEGMENT_WIDTH + (SEGMENT_MARGIN * 2),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: SEGMENT_MARGIN * 2,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.horizontal,
                size: Size(SEGMENT_HEIGHT, SEGMENT_WIDTH),
                isOn: displayMap[0] == 1),
          ),
          Positioned(
            top: SEGMENT_MARGIN * 2,
            left: SEGMENT_HEIGHT + SEGMENT_MARGIN * 2,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.vertical,
                size: Size(SEGMENT_WIDTH, SEGMENT_HEIGHT),
                isOn: displayMap[1] == 1),
          ),
          Positioned(
            top: SEGMENT_HEIGHT + SEGMENT_MARGIN * 3,
            left: SEGMENT_HEIGHT + SEGMENT_MARGIN * 2,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: Duration(milliseconds: 300),
                axis: Axis.vertical,
                size: Size(SEGMENT_WIDTH, SEGMENT_HEIGHT),
                isOn: displayMap[2] == 1),
          ),
          Positioned(
            top: SEGMENT_HEIGHT * 2 + SEGMENT_MARGIN * 3,
            left: SEGMENT_MARGIN * 2,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.horizontal,
                size: Size(SEGMENT_HEIGHT, SEGMENT_WIDTH),
                isOn: displayMap[3] == 1),
          ),
          Positioned(
            top: SEGMENT_HEIGHT + SEGMENT_MARGIN * 3,
            left: 0,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.vertical,
                size: Size(SEGMENT_WIDTH, SEGMENT_HEIGHT),
                isOn: displayMap[4] == 1),
          ),
          Positioned(
            top: SEGMENT_MARGIN * 2,
            left: 0,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.vertical,
                size: Size(SEGMENT_WIDTH, SEGMENT_HEIGHT),
                isOn: displayMap[5] == 1),
          ),
          Positioned(
            top: SEGMENT_HEIGHT + SEGMENT_MARGIN * 1.5,
            left: SEGMENT_MARGIN * 2,
            child: AnimatedSegment(
                color: color,
                offOpacity: offOpacity,
                onOpacity: onOpacity,
                duration: this.fadeAnimationDuration,
                axis: Axis.horizontal,
                size: Size(SEGMENT_HEIGHT, SEGMENT_WIDTH),
                isOn: displayMap[6] == 1),
          ),
        ],
      ),
    );
  }

  _buildSegment(Axis axis, Size size, isOn) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: SegmentPainter(
            axis: axis, color: isOn == 1 ? Colors.black : Colors.grey[300]),
      ),
    );
  }
}
