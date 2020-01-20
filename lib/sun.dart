import 'package:flutter/material.dart';

class Sun extends StatefulWidget {
  Sun({this.color = const Color.fromRGBO(240, 220, 0, 0.5)});
  Color color;
  @override
  _SunState createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  AnimationController sunController;

  initState() {
    sunController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    sunController.repeat(reverse: true, min: .9);
    super.initState();
  }

  @override
  void dispose() {
    sunController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
            animation: sunController,
            builder: (context, child) {
              return Positioned(
                top: -40,
                left: -40,
                child: Container(
                  width: 140 * sunController.value,
                  height: 140 * sunController.value,
                  decoration: BoxDecoration(
                      color: widget.color.withOpacity(.5),
                      borderRadius: BorderRadius.circular(70)),
                ),
              );
            }),
        AnimatedBuilder(
            animation: sunController,
            builder: (context, child) {
              return Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 160 * sunController.value,
                  height: 160 * sunController.value,
                  decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(80)),
                ),
              );
            }),
        Positioned(
          top: -30,
          left: -30,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(60)),
          ),
        ),
      ],
    );
  }
}
