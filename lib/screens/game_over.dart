import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_plane/game/assets.dart';
import 'package:flutter_dash_plane/game/dash_plane_game.dart';

import '../components/tree_group.dart';
import '../googleform/form.dart';

class GameOverScreen extends StatelessWidget {
  final DashPlaneGame game;
  static const id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage(
        //     Assets.gameOver,
        //   ),
        // )
        // ),
        child: GestureDetector(
          onTap: () {},
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Assets.gameOver,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Text(
                "Your Score is ${game.score}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              GoogleFormFields(
            game: game,
            url:
                "https://docs.google.com/forms/d/e/1FAIpQLSckDdC3WHsLuWKX1bgk0gTCA7y-56pnSiYGCg7nx0_9sAabwg/formResponse",
            score: 12,
          ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xff085A8D),
                      ),
                    ),
                    onPressed: () {
                      AlertDialog(
                        title: Text('TextField in Dialog'),
                        content: TextField(
                          onChanged: (value) {},
                          // controller: _textFieldController,
                          decoration:
                              InputDecoration(hintText: "Text Field in Dialog"),
                        ),
                      );
                      // game.overlays.add('gameOver');
                    },
                    child: Text(
                      "Add to rank list",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xff085A8D),
                      ),
                    ),
                    onPressed: () {
                      game.plane.reset();
                      game.score = 0;
                      game.removeWhere((c) => c is TreeGroup);
                      game.resumeEngine();
                      game.overlays.remove('gameOver');
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
