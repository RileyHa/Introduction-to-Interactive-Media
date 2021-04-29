public class howTo {

  void display() {
    image(inst, 0, 0, 1118, 628);
  }

  void displayHow() {
    if ((mouseX > 504 && mouseX < 552) && (mouseY > 535 && mouseY < 577)) {
      erase();
      isStartPage = true;
      start.display();
    }
  }
}
