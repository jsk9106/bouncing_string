import 'package:bouncing_string/config/constants.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
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
    final double circleRadius = screen.width * .04;

    return CustomPaint(
      size: Size(circleRadius, circleRadius),
      painter: CirclePainter(
        moveX: moveX,
        moveY: moveY,
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.moveX,
    required this.moveY,
  });

  final double moveX;
  final double moveY;

  final _paint = Paint()
    ..color = $style.colors.secondary
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(moveX - size.width / 2, moveY - size.height / 2, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
