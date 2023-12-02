import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';
import 'package:flutter_dash_plane/game/tree_position.dart';

class Tree extends SpriteComponent with HasGameRef<DashPlane> {
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
        position.y = gameRef.size.y - size.y;
        sprite = Sprite(tree);
        break;
      case TreePosition.top:
        position.y = 0;
        sprite = Sprite(treeRotated);
        break;
    }
    return super.onLoad();
  }
}
