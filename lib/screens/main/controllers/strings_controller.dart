import 'package:get/get.dart';
import 'dart:math' as math;

class StringsController extends GetxController {
  final double bounce = .92;
  double detect = 10;

  // 피타고라스의 정리를 이용하여 두 점 사이의 직선 거리를 계산
  double distance(double x1, double y1, double x2, double y2) {
    final double x = x2 - x1;
    final double y = y2 - y1;

    return math.sqrt(x * x + y * y);
  }

  // 두 점을 이용하여 선분을 나타내고, 그 선분과 주어진 원의 관계를 검사하여 선분이 원과 교차하는지 여부를 확인
  bool lineCircle(double x1, double y1, double x2, double y2, double cx, double cy, double r) {
    final double lineLength = distance(x1, y1, x2, y2);
    final double p = (((cx - x1) * (x2 - x1)) + ((cy - y1) * (y2 - y1))) / math.pow(lineLength, 2);

    final px = x1 + (p * (x2 - x1));
    final py = y1 + (p * (y2 - y1));

    return distance(px, py, cx, cy) < r;
  }
}
