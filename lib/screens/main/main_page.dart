import 'package:bouncing_string/data/bouncing_string.dart';
import 'package:bouncing_string/data/point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circle.dart';
import 'controllers/main_controller.dart';
import 'strings.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size screen = constraints.biggest;

          return GetBuilder<MainController>(
            initState: (state) => controller.init(screen),
            builder: (_) {
              return Stack(
                children: [
                  Strings(
                    strings: controller.strings,
                    moveX: controller.moveX,
                    moveY: controller.moveY,
                  ),
                  Circle(
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
              );
            },
          );
        },
      ),
    );
  }
}
