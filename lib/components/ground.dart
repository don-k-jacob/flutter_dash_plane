import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/configuration.dart';

import '../game/dash_plane_game.dart';

class Ground extends ParallaxComponent<DashPlaneGame> {
  Ground();
  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(ParallaxImage(
        ground,
        fill: LayerFill.none,
      )),
    ]);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Config.gameSpeed;
    super.update(dt);
  }
}
