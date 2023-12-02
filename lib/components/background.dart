import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/configuration.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

class Background extends ParallaxComponent<DashPlane>
    with HasGameRef<DashPlane> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(
          background,
          fill: LayerFill.height,
        ),
      ),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
