import 'package:digital_glass_clock/char_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class InfoPanel extends StatelessWidget {
  InfoPanel({this.clockModel});
  final ClockModel clockModel;

  List<Widget> stringToCharGridList(context, String s) {
    if(s.isEmpty) return [];
    return s
        .toUpperCase()
        .runes
        .map((int rune) => Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: CharGrid(
                tileColor:
                    Theme.of(context).textTheme.body1.color.withOpacity(.7),
                char: String.fromCharCode(rune),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: stringToCharGridList(
                    context, clockModel.location??""),
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children:
                    stringToCharGridList(context, clockModel.weatherString??""),
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children:
                    stringToCharGridList(context, clockModel.temperatureString??""),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
