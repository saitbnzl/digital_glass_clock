import 'package:digital_glass_clock/seven_segment_display.dart';
import 'package:digital_glass_clock/utils.dart';
import 'package:flutter/material.dart';

class DoubleDigitDisplay extends StatelessWidget {
  DoubleDigitDisplay({this.value, this.displayColor})
      : assert(value.length == 2, "Value length must be 2!");

  final String value;
  final Color displayColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SevenSegmentDisplay(
              color: displayColor,
              onOpacity: 0.8,
              offOpacity: 0.1,
              fadeAnimationDuration: Duration(milliseconds: 250),
              displayMap: Utils.charToDisplayMap(value[0])),
        ),
        SevenSegmentDisplay(
            color: displayColor,
            onOpacity: 0.8,
            offOpacity: 0.1,
            fadeAnimationDuration: Duration(milliseconds: 250),
            displayMap: Utils.charToDisplayMap(value[1])),
      ],
    );
  }
}
