public class startPage {
  void display() {
    if (isStartPage) {

      image(logo, 150, 180, 440, 340);
      image(how, 200, 650, 320, 60);
      image(startButton, 200, 800, 320, 60);
    }
  }

  void displayStart() {
    if ((mouseX > 200 && mouseX < 520) && (mouseY > 650 && mouseY < 710)) {
      erase();
      isStartPage = false;
      howToPlay.display();
    }
    if ((mouseX> 200 && mouseX < 520) && (mouseY > 800 && mouseY < 860)) {
      erase();
      isStartPage = false;
      gameStart = true;
      gameEnd = false;
      gamePage.display();
    }
  }
}
