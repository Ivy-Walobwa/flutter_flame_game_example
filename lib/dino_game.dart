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
    _dinoPlayer.direction = direction;
  }
  

}