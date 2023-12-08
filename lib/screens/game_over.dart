import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

import '../components/tree_group.dart';

class GameOverScreen extends StatelessWidget {
  final DashPlaneGame game;
  static const id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          Assets.gameOver,
        ),
      )),
      child: GestureDetector(
        onTap: () {
          game.plane.reset();
          game.score = 0;
          game.removeWhere((c) => c is TreeGroup);
          game.resumeEngine();
          game.overlays.remove('gameOver');
        },
        child: Center(
            child: Text(
          "Your Score is ${game.score}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        )),
      ),
    );
  }
}
