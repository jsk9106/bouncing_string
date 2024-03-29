import 'dart:math' as math;

class GlobalFunction {
  // 피타고라스의 정리를 이용하여 두 점 사이의 직선 거리를 계산
  static double distance(double x1, double y1, double x2, double y2) {
    final double x = x2 - x1;
    final double y = y2 - y1;

    return math.sqrt(x * x + y * y);
  }

  // 두 점(px, py), (cx, cy)을 이용하여 거리를 구하고, 그 거리와 범위(r)를 비교하여 교차되는지 확인
  static bool lineCircle(double x1, double y1, double x2, double y2, double cx, double cy, double r) {
    final double lineLength = distance(x1, y1, x2, y2);
    final double p = (((cx - x1) * (x2 - x1)) + ((cy - y1) * (y2 - y1))) / math.pow(lineLength, 2);

    final px = x1 + (p * (x2 - x1));
    final py = y1 + (p * (y2 - y1));

    return distance(px, py, cx, cy) < r;
  }
}