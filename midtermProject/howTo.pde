public class howTo {
  void display() {
    image(instruction, 0, 50, 720, 681.4);
    image(back, 300, 900, 156, 80);
  }

  void displayHow() {
    if ((mouseX > 300 && mouseX < 456) && (mouseY > 900 && mouseY < 980)) {
      erase();
      isStartPage = true;
      start.display();
    }
  }
}
