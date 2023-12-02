import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/game/configuration.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';
import 'package:flutter_dash_plane/game/tree_position.dart';

import 'tree.dart';

class TreeGroup extends PositionComponent with HasGameRef<DashPlane> {
  TreeGroup();
  final _random = Random();
  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    final hightMinusGround = gameRef.size.y - 0;
    final spacing = 100 + _random.nextDouble() * (hightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (hightMinusGround - spacing);
    addAll([
      Tree(
        treePosition: TreePosition.top,
        height: centerY - spacing / 2,
      ),
      Tree(
        treePosition: TreePosition.bottom,
        height: hightMinusGround - (centerY + spacing / 2),
      ),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;
    if (position.x < -10) {
      removeFromParent();
      debugPrint('removed');
    }
    super.update(dt);
  }
}
