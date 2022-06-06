import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dino_game.dart';
import 'helpers/navigation_keys.dart';

void main() {
  final game = DinoGame();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(
              game: game,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: NavigationKeys(onDirectionChanged: game.onArrowKeyChanged,),
            ),
          ],
        ),
      ),
    ),
  );
}
