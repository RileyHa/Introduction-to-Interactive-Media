class target {

  int x, y;
  color c;

  target(color c) {
    this.c = c;
  }
  void target_position(int x, int y) {
    this.x =x;
    this.y = y;
  }
    void target_draw() {
      strokeWeight(1);
      fill(c);
      rect(x, y, 50, 20);
    }
}
