import 'package:digital_glass_clock/windmill_head.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WindMill extends StatefulWidget {
  @override
  _WindMillState createState() => _WindMillState();
}

class _WindMillState extends State<WindMill>
    with SingleTickerProviderStateMixin {
  AnimationController windmillController;
  initState() {
    windmillController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    windmillController.repeat(min: 0, max: 1);
    super.initState();
  }

  @override
  void dispose() {
    windmillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
              left: 95,
              bottom: 0,
              child: Container(
                height: 90,
                width: 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      Colors.grey[400],
                      Colors.grey[300],
                      Colors.grey[400]
                    ])),
              )),
          Container(
            width: 200,
            height: 200,
            child: AnimatedBuilder(
                animation: windmillController,
                builder: (context, snapshot) {
                  return Transform.rotate(
                      origin: Offset(0, 0),
                      angle: math.pi * windmillController.value,
                      child: WindMillHead(size: 200));
                }),
          ),
          if (Theme.of(context).brightness == Brightness.dark)
            Container(
              width: 200,
              height: 200,
              color: Colors.black.withOpacity(.4),
            )
        ],
      ),
    );
  }
}
