public class startPage {
  void display() {
    if (isStartPage) {      
      image(Start, 0, 0, 1117, 628);
    }
  }

  void displayStart() {

    if ((mouseX > 94 && mouseX < 184) && (mouseY > 550 && mouseY < 588)) {
      erase();
      isStartPage = false;
      gameStart = true;
      page1 = true;
      gameEnd = false;
    }
    if ((mouseX> 288 && mouseX < 473) && (mouseY > 550 && mouseY < 588)) {
      erase();
      isStartPage = false;
      instruction.display();
    }
  }
}
