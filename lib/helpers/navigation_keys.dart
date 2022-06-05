import 'package:flutter/material.dart';
import 'directions.dart';

class NavigationKeys extends StatefulWidget {
  final ValueChanged<Direction>? onDirectionChanged;

  const NavigationKeys({Key? key, required this.onDirectionChanged})
      : super(key: key);

  @override
  State<NavigationKeys> createState() => _NavigationKeysState();
}

class _NavigationKeysState extends State<NavigationKeys> {
  Direction direction = Direction.none;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 120,
      child: Column(
        children: [
          ArrowKey(
            icons: Icons.keyboard_arrow_up,
            onTap: () {
              updateDirection(Direction.up);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowKey(
                icons: Icons.keyboard_arrow_left,
                onTap: () {
                  updateDirection(Direction.left);
                },
              ),
              ArrowKey(
                icons: Icons.keyboard_arrow_right,
                onTap: () {
                  updateDirection(Direction.right);
                },
              ),
            ],
          ),
          ArrowKey(
            icons: Icons.keyboard_arrow_down,
            onTap: () {
              updateDirection(Direction.down);
            },
          ),
        ],
      ),
    );
  }

  void updateDirection(Direction newDirection) {
    direction = newDirection;
    widget.onDirectionChanged!(direction);
  }
}

class ArrowKey extends StatelessWidget {
  const ArrowKey({
    Key? key,
    required this.icons,
    required this.onTap,
  }) : super(key: key);
  final IconData icons;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0x88ffffff),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Icon(
          icons,
          size: 42,
        ),
      ),
    );
  }
}
