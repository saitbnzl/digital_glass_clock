import 'dart:math' as math;

import 'package:digital_glass_clock/seven_segment_display.dart';

class Utils {
  static double degreesToRadians(double degrees) {
    return math.pi / 180 * degrees;
  }

  static List<int> charToDisplayMap(String char) {
    assert(SevenSegmentDisplay.CHAR_MAPS.containsKey(char),
        "Char is not defined: $char");
    return SevenSegmentDisplay.CHAR_MAPS[char];
  }
}
