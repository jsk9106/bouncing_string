import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/bouncing_string.dart';
import '../../../data/point.dart';

class MainController extends GetxController {
  final double initPosition = -5000;

  late double moveX = initPosition;
  late double moveY = initPosition;

  late final double x1;
  late double y1;
  late final double x2;
  late double y2;

  late final double middleX;
  late double middleY;

  List<BouncingString> strings = [];

  @override
  void onInit() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      update();
    });
    super.onInit();
  }

  void init(Size screen) {
    const double xGap = 20;
    const double yGap = 20;
    final int total = ((screen.height - yGap) / yGap).ceil();

    x1 = xGap;
    x2 = screen.width - xGap;
    middleX = ((x2 - x1) / 2) + x1;

    for (int i = 0; i < total; i++) {
      y1 = i * yGap + yGap;
      y2 = i * yGap + yGap;

      middleY = ((y2 - y1) / 2) + y1;

      strings.add(
        BouncingString(
          start: Point(x: x1, y: y1, ox: x1, oy: y1),
          middle: Point(x: middleX, y: middleY, ox: middleX, oy: middleY),
          end: Point(x: x2, y: y2, ox: x2, oy: y2),
        ),
      );
    }

    // x1 = xGap;
    // y1 = screen.height / 2;
    // x2 = screen.width - xGap;
    // y2 = screen.height / 2;
    //
    // middleX = ((x2 - x1) / 2) + x1;
    // middleY = ((y2 - y1) / 2) + y1;
    //
    // strings = [
    //   BouncingString(
    //     start: Point(x: x1, y: y1, ox: x1, oy: y1),
    //     middle: Point(x: middleX, y: middleY, ox: middleX, oy: middleY),
    //     end: Point(x: x2, y: y2, ox: x2, oy: y2),
    //   ),
    // ];
  }

  void onPanStart(DragStartDetails details) {
    moveX = details.localPosition.dx;
    moveY = details.localPosition.dy;
  }

  void onPanUpdate(DragUpdateDetails details) {
    moveX = details.localPosition.dx;
    moveY = details.localPosition.dy;
  }

  void onPanEnd(DragEndDetails details) {
    moveX = initPosition;
    moveY = initPosition;
  }
}
