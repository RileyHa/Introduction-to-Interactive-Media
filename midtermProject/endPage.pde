public class endPage {
  void display() {
    fill(255, 255, 255);
    rect(0, 0, width, height);
    endLogo = loadImage("image/endLogo.png");
    image(endLogo, 90, 50, 527.6, 441.2);
    score = loadImage("image/score.png");
    image(score, 200, 550, 296.2, 71.2);
    restart = loadImage("image/restart.png");
    image(restart, 280, 900, 162, 60);

    textSize(80);
    fill(0);
    text(earn, 300, 760);
  }

  void displayEnd() {
    if ((mouseX > 280 && mouseX < 442) && (mouseY > 900 && mouseY < 960)) {
      erase();
      isStartPage = true;
      gameEnd = false;
      gameStart = false;
      start.display();
      gamePage.resetGame();
      earn = 0;
    }
  }
}
