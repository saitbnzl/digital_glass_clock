import 'package:digital_glass_clock/cloudy_background.dart';
import 'package:digital_glass_clock/foggy_background.dart';
import 'package:digital_glass_clock/info_panel.dart';
import 'package:digital_glass_clock/rainy_background.dart';
import 'package:digital_glass_clock/snowy_background.dart';
import 'package:digital_glass_clock/sunny_background.dart';
import 'package:digital_glass_clock/thunderstorm_background.dart';
import 'package:digital_glass_clock/windy_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class ClockContainer extends StatelessWidget {
  ClockContainer({this.child, this.clockModel});
  final Widget child;
  final ClockModel clockModel;

  @override
  Widget build(BuildContext context) {
    String weather = clockModel.weatherString;
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: <Widget>[
        if (weather == "sunny") SunnyBackground(),
        if (weather == "thunderstorm") ThunderStormBackground(),
        if (weather == "rainy") RainyBackogrund(),
        if (weather == "snowy") SnowyBackground(),
        if (weather == "cloudy") CloudyBackground(),
        if (weather == "foggy") FoggyBackground(),
        if (weather == "windy") WindyBackground(),
        Align(
            alignment: Alignment.topRight,
            child: InfoPanel(
              clockModel: clockModel,
            )),
        child
      ],
    );
  }
}
