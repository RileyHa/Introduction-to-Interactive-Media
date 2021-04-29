public class Switch {

  float switchX, switchY;
  int switchWidth, switchHeight;
  color switchColor, frame;
  boolean switchOver;

  Switch(float posX, float posY, int wid, int hei) {

    switchX = posX;
    switchY = posY;

    switchWidth = wid;
    switchHeight = hei;

    frame = color(204, 0, 20);
    switchColor = color(255);
  }

  boolean overSwitch(float x, float y, int switchWidth, int switchHeight, int clickState) {
    if ((mouseX >= x - switchWidth/2 && mouseX <= x + switchWidth/2)&&(mouseY >= y -switchHeight/2 && mouseY <= y + switchHeight/2) || (clickState == 1)) {
      return true;
    } else {
      return false;
    }
  }

  void update(int clickState) {
    if (overSwitch(switchX, switchY, switchWidth, switchHeight, clickState)) {
      switchOver = true;
    } else {
      switchOver = false;
    }
  }

  void display() {
    stroke(frame);
    fill(switchColor);
    strokeWeight(8);
    rect(switchX, switchY, switchWidth, switchHeight);
  }
}
