import 'package:bouncing_string/config/global_assets.dart';
import 'package:flutter/material.dart';

class Cursor extends StatelessWidget {
  const Cursor({
    super.key,
    required this.screen,
    required this.moveX,
    required this.moveY,
  });

  final Size screen;
  final double moveX;
  final double moveY;

  @override
  Widget build(BuildContext context) {
    const double size = 30;

    return Positioned(
      left: moveX - size / 2,
      top: moveY - size / 2,
      child: Transform.rotate(
        angle: 6,
        child: Image.asset(GlobalAssets.pngCursor, width: size),
      ),
    );
  }
}
