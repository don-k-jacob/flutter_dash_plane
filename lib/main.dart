import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/screens/main_menu_scree.dart';
//!https://github.com/don-k-jacob/flutter_dash_plane
import 'game/dash_plane_game.dart';
import 'googleform/form.dart';
import 'screens/game_over.dart';

void main() {
  final game = DashPlaneGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game),
      'rankList': (context, _) => RankList(game: game),

    },
  ));
}
