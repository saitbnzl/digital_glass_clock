import 'dart:math';

import 'package:flutter/material.dart';

class Flake extends StatefulWidget {
  Flake({this.screenSize, this.length, this.color});
  final Size screenSize;
  final double length;
  final Color color;

  @override
  _FlakeState createState() => _FlakeState();
}

class _FlakeState extends State<Flake> with SingleTickerProviderStateMixin {
  AnimationController dropController;
  double posX = 0, posY = 0;
  int dir = 1;
  double opacity = 1.0;
  Random rng = Random();

  @override
  void initState() {
    opacity = rng.nextDouble();
    dir = rng.nextBool() ? -1 : 1;
    posX = rng.nextDouble() * widget.screenSize.width;
    posY = rng.nextDouble() * widget.screenSize.height;
    dropController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
                2000 + (posY / widget.screenSize.height * 2000).toInt()));
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
              left: posX + (dropController.value * 30 * dir),
              top: -posY +
                  ((MediaQuery.of(context).size.height + posY) *
                      dropController.value),
              child: Container(
                width: 8 * opacity,
                height: 8 * opacity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: widget.color.withOpacity(opacity)),
              ),
            );
          },
        ),
      ],
    );
  }
}
