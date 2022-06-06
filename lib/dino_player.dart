import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'helpers/directions.dart';

class DinoPlayer extends SpriteAnimationComponent with HasGameRef {
  DinoPlayer() : super(size: Vector2.all(100.0), anchor: Anchor.center);

  late final SpriteAnimation _walkingRightAnimation;
  late final SpriteAnimation _walkingLeftAnimation;
  late final SpriteAnimation _idleAnimation;

  final double _animationSpeed = .15;
  Direction direction = Direction.none;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAnimations().then((_) => {animation = _idleAnimation});
  }


  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  updatePosition(double dt) {
    switch (direction) {
      case Direction.up:
        position.y --;
        break;
      case Direction.down:
        position.y ++;
        break;
      case Direction.left:
        animation = _walkingLeftAnimation;
        position.x --;
        break;
      case Direction.right:
        animation = _walkingRightAnimation;
        position.x ++;
        break;
      case Direction.none:
        animation = _idleAnimation;
        break;
    }
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await gameRef.images.load('spritesheet.png'),
        columns: 30,
        rows: 1);

    _idleAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 9);

    _walkingRightAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 10, to: 19);
    _walkingLeftAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from: 20, to: 29);
  }
}
