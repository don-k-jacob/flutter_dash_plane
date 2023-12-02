import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';
import 'package:flutter_dash_plane/game/tree_position.dart';

import '../game/configuration.dart';

class Tree extends SpriteComponent with HasGameRef<DashPlaneGame> {
  Tree({
    required this.treePosition,
    required this.height,
  });

  @override
  final double height;
  final TreePosition treePosition;
  FutureOr<void> onLoad() async {
    final tree = await Flame.images.load(Assets.treeUp);
    final treeRotated = await Flame.images.load(Assets.treeDown);
    size = Vector2(50, height);
    switch (treePosition) {
      case TreePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(tree);
        break;
      case TreePosition.top:
        position.y = 0;
        sprite = Sprite(treeRotated);
        break;
    }
    add(RectangleHitbox());

    return super.onLoad();
  }
}
