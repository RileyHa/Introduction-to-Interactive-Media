class ball {

  int x, y, r;
  color c;

  ball(int x, int y, int r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }

  void ball_move(int x, int y) {
    this.x += x;
    this.y += y;
    ball_draw();
  }

  void ball_draw() {
    strokeWeight(1);
    fill(c);
    ellipse(x, y, r, r);
  }
}
