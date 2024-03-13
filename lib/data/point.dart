class Point {
  Point({
    this.x = 0,
    this.y = 0,
    this.ox = 0,
    this.oy = 0,
    this.vx = 0,
    this.vy = 0,
  });

  double x; // x 좌표
  double y; // y 좌표
  double ox; // 이전 프레임 x 좌표
  double oy; // 이전 프레임 y 좌표
  double vx; // x 방향의 속도
  double vy; // y 방향의 속도
}
