// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:digital_glass_clock/char_grid.dart';
import 'package:digital_glass_clock/circle_painter.dart';
import 'package:digital_glass_clock/clock_container.dart';
import 'package:digital_glass_clock/double_digit_display.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element { background, text, shadow, displayColor }

final _lightTheme = {
  _Element.background: Colors.white,
  _Element.text: Colors.white,
  _Element.shadow: Colors.black,
  _Element.displayColor: Colors.black
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text: Colors.white,
  _Element.shadow: Color(0xFF174EA6),
  _Element.displayColor: Colors.white
};

class DigitalGlassClock extends StatefulWidget {
  const DigitalGlassClock(this.model);

  final ClockModel model;

  @override
  _DigitalGlassClockState createState() => _DigitalGlassClockState();
}

class _DigitalGlassClockState extends State<DigitalGlassClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  var _temperature = '';
  var _temperatureRange = '';
  var _condition = '';
  var _location = '';

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalGlassClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperatureString;
      _temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
      _condition = widget.model.weatherString;
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final seconds = DateFormat('ss').format(_dateTime);

    return ClockContainer(
      clockModel: widget.model,
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.mirror,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0,
                      0.15,
                      0.85,
                      1.0
                    ],
                    colors: [
                      Colors.white.withOpacity(.25),
                      Colors.white.withOpacity(.1),
                      Colors.white.withOpacity(.1),
                      Colors.white.withOpacity(.25),
                    ]),
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.white.withOpacity(.3), width: 0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DoubleDigitDisplay(
                      value: hour,
                      displayColor: colors[_Element.displayColor],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Colon(color: colors[_Element.displayColor]),
                    ),
                    DoubleDigitDisplay(
                        value: hour,
                        displayColor: colors[_Element.displayColor]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Colon(color: colors[_Element.displayColor]),
                    ),
                    DoubleDigitDisplay(
                        value: seconds,
                        displayColor: colors[_Element.displayColor]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Colon extends StatelessWidget {
  Colon({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
            height: 10,
            width: 10,
            child: CustomPaint(painter: CirclePainter(color: color))),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
              height: 10,
              width: 10,
              child: CustomPaint(painter: CirclePainter(color: color))),
        ),
      ],
    );
  }
}
