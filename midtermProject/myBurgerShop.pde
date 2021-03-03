import java.util.ArrayList;
import java.util.*;
import processing.sound.*;
SoundFile chaching;
SoundFile clickmus;

PImage logo, how, startButton;
PImage instruction, back;
PImage endLogo, score, restart;
PImage beef, background, bottom, cheese, lettuce, sauce, tomato, topbun;

boolean isStartPage = true;
boolean gameStart = false;
boolean gameEnd = false;

int fps = 1; //frame per second
int time = 5;
int earn = 0;

startPage start = new startPage();
howTo howToPlay = new howTo();
endPage end = new endPage();
gamePage gamePage = new gamePage();


void setup() {
  background(255, 255, 255);
  size(720, 1000);
  
  
  clickmus= new SoundFile(this, "clickmus.wav");
  chaching= new SoundFile(this, "chaching.wav");
  

  gamePage.getOrder();
  print(gamePage.customerOrder);

  logo = loadImage("image/logo.png");
  how = loadImage("image/howtoplay.png");
  startButton = loadImage("image/start.png");

  instruction = loadImage("image/instruction.png");
  back = loadImage("image/back.png");

  background = loadImage("image/bkgd.png");
  beef = loadImage("image/beef.png");
  bottom = loadImage("image/bottom.png");
  cheese = loadImage("image/cheese.png");
  lettuce = loadImage("image/lettuce.png");
  sauce = loadImage("image/sauce.png");
  tomato = loadImage("image/tomato.png");
  topbun = loadImage("image/topbun.png");
}

void draw() {
  time = ++time%((2/fps)+1);
  start.display();
  if (gameStart && !gameEnd) {
    gamePage.display();
    gamePage.drawIng();
    if (time == (2/fps)) {
      gamePage.pickIng();
      gamePage.fall();
      gamePage.check();
    }
  }

  if (gameEnd) {
    end.display();
  }
}

void erase() {
  fill(255, 255, 255);
  noStroke();
  rect(0, 0, width, height);
}

void mouseClicked() {
  start.displayStart();
  howToPlay.displayHow();
  end.displayEnd();
  clickmus.play();
}

