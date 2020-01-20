import 'dart:math';

import 'dart:ui';

class Point {
  Point({this.pos});
  final Offset pos;
}

class RootPoint extends Point {
  RootPoint({this.pos}) : super(pos: pos);
  final Offset pos;
  List<Point> children = [];
}

class LightningModel {
  Random rng = Random();

  int getZDirection(len) {
    return len % 2 == 0 ? -1 : 1;
  }

  List<RootPoint> rootPoints = [];

  clear() {
    rootPoints.clear();
  }

  extendRoot() {
    int numberOfChilds = rng.nextInt(5) + 2;
    Offset newPos;
    if (rootPoints.isEmpty) {
      newPos = Offset(rng.nextDouble() * 300, rng.nextDouble() * 30);
    } else {
      newPos = Offset(
          rootPoints.last.pos.dx +
              getZDirection(rootPoints.length) * (rng.nextDouble() * 20 + 5),
          rootPoints.last.pos.dy + (rng.nextDouble() * 20 + 5));
    }
    rootPoints.add(RootPoint(pos: newPos));
    RootPoint lastRootPoint = rootPoints.last;
    lastRootPoint.children.add(Point(pos: rootPoints.last.pos));
    int dir = getZDirection(rootPoints.length);
    for (int i = 0; i < numberOfChilds; i++) {
      Offset childPos = Offset(
          lastRootPoint.children.last.pos.dx +
              dir * (rng.nextDouble() * 10 + 5),
          5 +
              lastRootPoint.children.last.pos.dy +
              getZDirection(lastRootPoint.children.length) *
                  (rng.nextDouble() * 5 + 5));
      lastRootPoint.children.add(Point(pos: childPos));
    }
  }
}
