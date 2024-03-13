import 'dart:math' as math;

import 'package:bouncing_string/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cursor.dart';
import 'controllers/main_controller.dart';
import 'strings.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double circleSize = math.max(screen.width, screen.height) * .5;

    return Scaffold(
      body: Center(
          child: Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              color: $style.colors.back,
              borderRadius: BorderRadius.circular(circleSize),
              border: Border.all(width: 4, color: $style.colors.secondary),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(circleSize),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final Size screen = constraints.biggest;

                  return GetBuilder<MainController>(
                    initState: (state) => controller.init(screen),
                    builder: (_) {
                      return MouseRegion(
                        cursor: controller.isClick ? SystemMouseCursors.none : SystemMouseCursors.basic,
                        child: Stack(
                          children: [
                            Strings(
                              strings: controller.strings,
                              moveX: controller.moveX,
                              moveY: controller.moveY,
                            ),
                            Cursor(
                              screen: screen,
                              moveX: controller.moveX,
                              moveY: controller.moveY,
                            ),
                            GestureDetector(
                              onPanStart: controller.onPanStart,
                              onPanUpdate: controller.onPanUpdate,
                              onPanEnd: controller.onPanEnd,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}
