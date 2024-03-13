import 'package:bouncing_string/config/constants.dart';
import 'package:bouncing_string/data/bouncing_string.dart';
import 'package:flutter/material.dart';

import '../../utill/global_function.dart';

class Strings extends StatelessWidget {
  const Strings({
    super.key,
    required this.strings,
    required this.moveX,
    required this.moveY,
  });

  final List<BouncingString> strings;
  final double moveX;
  final double moveY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        strings.length,
        (index) => CustomPaint(
          painter: StringPainter(
            string: strings[index],
            moveX: moveX,
            moveY: moveY,
          ),
        ),
      ),
    );
  }
}

class StringPainter extends CustomPainter {
  StringPainter({
    required this.string,
    required this.moveX,
    required this.moveY,
  });

  final BouncingString string;
  final double moveX;
  final double moveY;

  @override
  void paint(Canvas canvas, Size size) {
    if (GlobalFunction.lineCircle(
      string.start.x,
      string.start.y,
      string.end.x,
      string.end.y,
      moveX,
      moveY,
      string.detect,
    )) {
      string.detect = 300;
      final double tx = (string.middle.ox + moveX) / 2;
      final double ty = moveY;
      string.middle.vx = tx - string.middle.x;
      string.middle.vy = ty - string.middle.y;
    } else {
      string.detect = 10;
      final double tx = string.middle.ox;
      final double ty = string.middle.oy;
      string.middle.vx += tx - string.middle.x;
      string.middle.vx *= bounce;
      string.middle.vy += ty - string.middle.y;
      string.middle.vy *= bounce;
    }

    string.middle.x += string.middle.vx;
    string.middle.y += string.middle.vy;

    Path path = Path();
    Paint paint = Paint()
      ..color = $style.colors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    double preX = string.start.x;
    double preY = string.start.y;

    path.moveTo(preX, preY);

    for (int i = 1; i < BouncingString.length; i++) {
      final cx = (preX + string.getPoint(i).x) / 2;
      final cy = (preY + string.getPoint(i).y) / 2;

      path.quadraticBezierTo(preX, preY, cx, cy);

      preX = string.getPoint(i).x;
      preY = string.getPoint(i).y;
    }

    path.lineTo(preX, preY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
