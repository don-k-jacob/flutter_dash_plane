import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/components/background.dart';
import 'package:flutter_dash_plane/components/ground.dart';

import '../components/plane.dart';
import '../components/tree_group.dart';
import 'configuration.dart';

class DashPlaneGame extends FlameGame with TapDetector, HasCollisionDetection {
  late FlyPlane plane;

  Timer intrvel = Timer(
    Config.pipeIntervel,
    repeat: true,
  );
  int score = 0;
  @override
  Future<void> onLoad() async {
    add(Background());
    addAll([
      Ground(),
      plane = FlyPlane(),
    ]);
    intrvel.onTick = () {
      add(TreeGroup());
      score++;
    };
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Render the score on the top-left corner of the screen
    final textStyle = TextStyle(color: Colors.black, fontSize: 20);
    final textSpan = TextSpan(text: 'Score: $score', style: textStyle);
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 200);
    textPainter.paint(canvas, Offset(10, 10));
  }

  @override
  void onTap() {
    plane.fly();
    super.onTap();
  }

  @override
  void update(double dt) {
    intrvel.update(dt);
    super.update(dt);
  }
}
