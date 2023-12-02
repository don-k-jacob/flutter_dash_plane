import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
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
  @override
  Future<void> onLoad() async {
    add(Background());
    addAll([
      Ground(),
      plane = FlyPlane(),
    ]);
    intrvel.onTick = () => add(TreeGroup());
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
