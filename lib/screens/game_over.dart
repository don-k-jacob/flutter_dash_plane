import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

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
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      // image: AssetImage(Assets.menu),
      // )),
      child: GestureDetector(
        onTap: () {
          game.plane.reset();
          game.overlays.remove('gameOver');
        },
        child: Image.asset(Assets.gameOver),
      ),
    );
  }
}
