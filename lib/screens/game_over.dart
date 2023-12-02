import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

class gameOverScreen extends StatelessWidget {
  final DashPlaneGame game;
  static const id = 'gameOver';
  const gameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.menu),
        )),
        child: GestureDetector(
          onTap: () {
            game.overlays.remove('gameOver');
            game.resumeEngine();
          },
          child: Image.asset(Assets.gameOver),
        ),
      ),
    );
  }
}
