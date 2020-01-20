import 'dart:async';
import 'dart:math';

import 'package:digital_glass_clock/lightning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PeriodicLightning extends StatefulWidget {
  @override
  _PeriodicLightningState createState() => _PeriodicLightningState();
}

class _PeriodicLightningState extends State<PeriodicLightning> {
  LightningModel _lightningModel = LightningModel();
  Random rng = Random();
  Timer timer;
  startLightning(lightningLength) {
    return Timer.periodic(Duration(milliseconds: 100), (t) {
      if (_lightningModel.rootPoints.length > lightningLength) {
        t.cancel();
        Future.delayed(Duration(milliseconds: 300), () {
          if (mounted) {
            setState(() {
              _lightningModel.clear();
            });
          }
        });
      }
      if (mounted) {
        setState(() {
          _lightningModel.extendRoot();
        });
      }
    });
  }

  lightningLoop() {
    if (mounted) {
      Duration nextLightningDelay =
          Duration(milliseconds: rng.nextInt(2000) + 1000);
      Future.delayed(nextLightningDelay, () {
        timer = startLightning(rng.nextInt(10) + 5);
        lightningLoop();
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      lightningLoop();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_lightningModel.rootPoints.isEmpty) return Container();
    return CustomPaint(
        painter: LightningPainter(lightningModel: _lightningModel));
  }
}

class LightningPainter extends CustomPainter {
  LightningPainter({@required this.lightningModel}) {
    rootPaint.color = Colors.white.withOpacity(1.0);
    rootPaint.style = PaintingStyle.stroke;
    rootPaint.strokeWidth = 4;
    childPaint.color = Colors.white.withOpacity(0.5);
    childPaint.style = PaintingStyle.stroke;
    childPaint.strokeWidth = 2;
  }

  final LightningModel lightningModel;
  Paint rootPaint = Paint();
  Paint childPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    createLightning(canvas, size);
  }

  decreaseOpacity(Color color) {
    double opacity = color.opacity;
    opacity -= .1;
    if (opacity < 0) {
      opacity = 0;
    }
    return color.withOpacity(opacity);
  }

  createLightning(Canvas canvas, Size size) {
    List<RootPoint> _rootPoints = lightningModel.rootPoints;
    for (int i = 0; i < _rootPoints.length - 1; i++) {
      rootPaint.color = decreaseOpacity(rootPaint.color);
      childPaint.color = decreaseOpacity(childPaint.color);
      RootPoint _currentPoint = _rootPoints[i];
      RootPoint _nextPoint = _rootPoints[i + 1];
      canvas.drawLine(_currentPoint.pos, _nextPoint.pos, rootPaint);
      for (int i = 0; i < _currentPoint.children.length - 1; i++) {
        Point _currentChild = _currentPoint.children[i];
        Point _nextChild = _currentPoint.children[i + 1];
        canvas.drawLine(_currentChild.pos, _nextChild.pos, childPaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
