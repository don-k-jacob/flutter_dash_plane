import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_dash_plane/game/configuration.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';
import 'package:flutter_dash_plane/game/tree_position.dart';

import 'tree.dart';

class TreeGroup extends PositionComponent with HasGameRef<DashPlane> {
  TreeGroup();
  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;
    addAll([
      Tree(
        treePosition: TreePosition.top,
        height: 100,
      ),
      Tree(
        treePosition: TreePosition.bottom,
        height: 200,
      ),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;
    super.update(dt);
  }
}
