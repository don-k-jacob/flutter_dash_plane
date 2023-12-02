import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/configuration.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

import '../game/plane_movement.dart';

class FlyPlane extends SpriteGroupComponent<PlaneMovement>
    with HasGameRef<DashPlane> {
  FlyPlane();

  @override
  FutureOr<void> onLoad() async {
    final planeUp = await gameRef.loadSprite(Assets.dashPlaneUp);
    final planeMid = await gameRef.loadSprite(Assets.dashPlaneMid);
    final planeDown = await gameRef.loadSprite(Assets.dashPlaneDown);

    size = Vector2(100, 70);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = PlaneMovement.middle;
    sprites = {
      PlaneMovement.up: planeUp,
      PlaneMovement.middle: planeMid,
      PlaneMovement.down: planeDown
    };

    return super.onLoad();
  }

  void fly() {

    add(MoveByEffect(
      Vector2(0, Config.throtil),
      EffectController(
        duration: 0.2,
        curve: Curves.decelerate,
      ),
      onComplete: () => PlaneMovement.up,
    ));
    current = PlaneMovement.down;

  }

  @override
  void update(double dt) {
    position.y += Config.gravity * dt;
    super.update(dt);
  }
}
