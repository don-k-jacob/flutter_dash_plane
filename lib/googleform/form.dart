import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../game/assets.dart';
import '../game/dash_plane_game.dart';

class RankList extends StatelessWidget {
  final DashPlaneGame game;

  static const id = 'rankList';

  const RankList({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.menu),
        )),
        child: GoogleFormFields(
          game: game,
          url:
              "https://docs.google.com/forms/d/e/1FAIpQLSckDdC3WHsLuWKX1bgk0gTCA7y-56pnSiYGCg7nx0_9sAabwg/formResponse",
          score: 12,
        ),
      ),
    );
  }
}

class GoogleFormFields extends StatefulWidget {
  final String url;
  final int score;
  final DashPlaneGame game;

  GoogleFormFields({
    required this.url,
    required this.score,
    required this.game,
  });

  @override
  _GoogleFormFieldsState createState() => _GoogleFormFieldsState();
}

class _GoogleFormFieldsState extends State<GoogleFormFields> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize text editing controllers based on the keys in the data map
  }

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks
    super.dispose();
  }

  void postData() async {
    final Map<String, String> data = {
      'entry.1076778284': name.text,
      'entry.1218588874': phone.text,
      'entry.213305903': name.text,
      'entry.1868961402': DateTime.now().toIso8601String(),

      // You can add more fields here if needed.
    };

    try {
      final response = await http.post(
        Uri.parse(widget.url),
        body: data,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        // Successful POST request
        print('POST request successful');
        print(response.body);
        // You can add further handling for the response here.
      } else {
        // Handle errors here
        print('POST request failed with status: ${response.statusCode}');
        print(response.body);
        // You can add error handling logic here.
      }
    } catch (e) {
      print(e.toString());
    }
  }
  //! https://docs.google.com/forms/d/e/1FAIpQLSdcILthy63ydKBJimGvc3AF-jaWXjNwP7LGqldJFjywK-hpjQ/formResponse?usp=pp_url&entry.1648447583=name&entry.285416938=age&entry.199427948=9207390779&entry.1738669411=A&entry.1398643913=2023-11-23

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: "Name of the player",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: "Phone ",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: "Score",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              postData();
              name.clear();
              phone.clear();
              widget.game.overlays.remove('gameOver');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 50,
              width: 200,
              child: const Center(
                child: Text(
                  "Add to the Rank List",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
