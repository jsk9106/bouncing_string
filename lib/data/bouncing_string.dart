import 'package:bouncing_string/data/point.dart';

class BouncingString {
  static const int length = 3;

  BouncingString({
    required this.start,
    required this.middle,
    required this.end,
    this.detect = 10,
  });

  Point start;
  Point middle;
  Point end;
  double detect;

  Point getPoint(int index) {
    switch (index) {
      case 0:
        return start;
      case 1:
        return middle;
      case 2:
        return end;
      default:
        return start;
    }
  }
}
