import 'dart:math';

import 'package:digital_glass_clock/raindrop_painter.dart';
import 'package:flutter/material.dart';

class RainDrop extends StatefulWidget {
  RainDrop({this.screenSize, this.length, this.color});
  final Size screenSize;
  final double length;
  final Color color;

  @override
  _RainDropState createState() => _RainDropState();
}

class _RainDropState extends State<RainDrop>
    with SingleTickerProviderStateMixin {
  AnimationController dropController;
  double posX = 0, posY = 0;

  @override
  void initState() {
    Random rng = Random();
    posX = rng.nextDouble() * widget.screenSize.width;
    posY = rng.nextDouble() * widget.screenSize.height;
    dropController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
                800 + (posY / widget.screenSize.height * 800).toInt()));
    dropController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: dropController,
          builder: (context, child) {
            return Positioned(
              left: posX,
              top: -posY +
                  ((MediaQuery.of(context).size.height + posY) *
                      dropController.value),
              child: CustomPaint(
                painter: RaindropPainter(widget.length, color: widget.color),
              ),
            );
          },
        ),
      ],
    );
  }
}
