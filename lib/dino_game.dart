import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'dino_player.dart';
import 'dino_world.dart';
import 'package:flutter/material.dart';
import 'helpers/directions.dart';

class DinoGame extends FlameGame with KeyboardEvents{
  DinoPlayer _dinoPlayer = DinoPlayer();
DinoWorld _dinoWorld = DinoWorld();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_dinoWorld);
    await add(_dinoPlayer);
    _dinoPlayer.position = _dinoWorld.size / 1.5;
    camera.followComponent(_dinoPlayer,
        worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y));

  }
  onArrowKeyChanged(Direction direction){
    switch(direction){
      case Direction.up:
        _dinoPlayer.y -=30;
        break;
      case Direction.down:
        _dinoPlayer.y +=30;
        break;
      case Direction.left:
        _dinoPlayer.x -=30;
        break;
      case Direction.right:
        _dinoPlayer.x +=30;
        break;
      case Direction.none:
        // TODO: Handle this case.
        break;
    }
  }
  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;

    if (isKeyDown) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        _dinoPlayer.x -=30;
      } else if(keysPressed.contains(LogicalKeyboardKey.arrowRight)){
        _dinoPlayer.x +=30;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
  //
  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   if(_dinoPlayer.x < size.x ){
  //     _dinoPlayer.x +=1;
  //   }
  // }

}