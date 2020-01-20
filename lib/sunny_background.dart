import 'package:digital_glass_clock/sun.dart';
import 'package:flutter/material.dart';

enum _Element { background, sun }

final _lightTheme = {
  _Element.background: Color(0xff33CCFF),
  _Element.sun: Color.fromRGBO(240, 220, 0, 1),
};

final _darkTheme = {
  _Element.background: Color.fromRGBO(50, 0, 0, 1),
  _Element.sun: Color.fromRGBO(240, 150, 0, 1),
};

class SunnyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: <Widget>[
        Container(
          color: _colors[_Element.background],
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Sun(
                  color: _colors[_Element.sun],
                ),
              )
            ],
          ),
        ),
        if (!isDarkTheme)
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white.withOpacity(.4),
                  Colors.transparent,
                ])),
          )
      ],
    );
  }
}
