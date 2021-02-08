class bar {

  int x, y, len, wei;

  bar(int x, int y, int len, int wei) {
    this.x = x;
    this.y = y;
    this.len = len;
    this.wei = wei;
  }

  void bar_draw() {
    strokeWeight(wei);
    line(x-(len/2), y, x+(len/2), y);
  }
  
  void bar_move(int x){
    this.x = x;
    bar_draw();
  }
}
