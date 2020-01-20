import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum _Element { background, sun }

final _lightTheme = {
  _Element.background: Color(0xff33CCFF),
};

final _darkTheme = {
  _Element.background: Colors.black,
};

class FoggyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;
    final _colors = isLightMode ? _lightTheme : _darkTheme;
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: _colors[_Element.background],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0,
                .5,
                1
              ],
                  colors: [
                Colors.grey[200].withOpacity(.9 - (!isLightMode ? 0.5 : 0)),
                Colors.grey.withOpacity(.5 - (!isLightMode ? 0.2 : 0)),
                Colors.grey.withOpacity(.1),
              ])),
        ),
      ],
    );
  }
}
