import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flutter_dash_plane/components/background.dart';

import '../components/plane.dart';
import '../components/tree_group.dart';
import 'configuration.dart';

class DashPlane extends FlameGame {
  late FlyPlane plane;
  Timer intrvel = Timer(
    Config.pipeIntervel,
    repeat: true,
  );
  @override
  Future<void> onLoad() async {
    add(Background());
    addAll([
      plane = FlyPlane(),
    ]);
    intrvel.onTick = () => add(TreeGroup());
  }

  @override
  void update(double dt) {
    intrvel.update(dt);
    super.update(dt);
  }
}
