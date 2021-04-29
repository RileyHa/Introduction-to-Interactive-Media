import processing.serial.*;
import processing.sound.*;
import java.util.*;

Serial myPort;

PImage Troy, Gabriella, Sharpay, Ryan, Taylor, Chad;
PImage Start, bckgd, inst;
PFont font;

Switch switch1, switch2, switch3, switch4, switch5, switch6;


startPage start = new startPage();
howTo instruction = new howTo();
endPage end = new endPage();
Score scoreCheck = new Score();


boolean isStartPage = true;
boolean gameStart = false;
boolean gameEnd = false;

int choice1 = 0;
int choice2 = 0;
int choice3 = 0;
int choice4 = 0;
int choice5 = 0;
int choice6 = 0;

int value = 0;
float prevFrame = 0;


boolean page1 = false;
boolean page2 = false;
boolean page3 = false;
boolean page4 = false;
boolean page5 = false;
boolean page6 = false;
boolean page7 = false;
boolean page8 = false;
boolean page9 = false;
boolean page10 = false;
boolean page11 = false;

String[] answer1 = new String[6];
String[] answer2 = new String[6];
String[] answer3 = new String[6];
String[] answer4 = new String[6];
String[] answer5 = new String[6];
String[] answer6 = new String[6];
String[] answer7 = new String[6];
String[] answer8 = new String[6];
String[] answer9 = new String[6];
String[] answer10 = new String[6];
String[] answer11 = new String[6];

StringList[] shuffle = new StringList[11];

StringList shuffle1 = new StringList();
StringList shuffle2 = new StringList();
StringList shuffle3 = new StringList();
StringList shuffle4 = new StringList();
StringList shuffle5 = new StringList();
StringList shuffle6 = new StringList();
StringList shuffle7 = new StringList();
StringList shuffle8 = new StringList();
StringList shuffle9 = new StringList();
StringList shuffle10 = new StringList();
StringList shuffle11 = new StringList();

String[][] answers = {answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10, answer11};

IntList scoreTroy;
IntList scoreGabriella;
IntList scoreSharpay;
IntList scoreRyan;
IntList scoreTaylor;
IntList scoreChad;

IntList scoreList;

String question1 = "What is (or was) your favorite subject in high school?";
String question2 = "Which of the following lyrics attracts you the most?";
String question3 = "If you had to work during summer, which job would you pick?";
String question4 = "What is your biggest fear?";
String question5 = "Which university attracts you the most?";
String question6 = "Which do you consider as your biggest flaw?";
String question7 = "Secret hobby that your friends will be most surprised at";
String question8 = "How would your friends describe you?";
String question9 = "What is your favorite musical instrument?";
String question10 = "What would cause you to end up in detention?";
String question11 = "What is most important to you right now?";

String[] troy = {"P.E.", "We're all in this together", "Private trainor", "Disappointing your parents", "U.C.Berkeley", "You are insecure", "Musical", "Selfless", "Guitar", "Being late", "My lover"};
String[] gabriella = {"Science", "Can I have this dance?", "Lifeguard at pool", "Showing your real emotions", "Stanford", "You are indecisive", "Dancing", "Independent", "Tambourine", "Talking back to a teacher", "My future career"};
String[] sharpay = {"Drama", "I want it all", "No thanks, I'm already rich", "Being alone", "University of Albuquerque", "You are self-centered", "Scholastic Decathlon", "Popular", "My voice", "Horrible grades", "Gaining popularity"};
String[] ryan = {"Music", "I don't dance", "Talent show organizer", "Being disliked", "Juilliard", "You are clumsy", "Yoga", "Goofy", "Piano", "Talking too much in class", "YOLO"};
String[] taylor = {"History", "Stick to the status quo", "Activity coordinator", "Being judged by others", "Yale", "You have the urge to always be right", "Baking", "Smart", "Castanets", "Getting into a fight", "Power and authority"};
String[] chad = {"Recess", "The boys are back", "Helping in the kitchen", "People changing for the worse", "I don't want to go to a uni", "You are stubborn", "Reading books", "Caring", "I hate music", "Skipping school", "Sports"};

void setup() {

  size (1120, 630);

  printArray(Serial.list());
  String portname=Serial.list()[2];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  
  font = createFont("MarkerFelt.ttf",72);

  Troy = loadImage("image/resultTroy.png");
  Gabriella = loadImage("image/resultGabriella.png");
  Sharpay = loadImage("image/resultSharpay.png");
  Ryan = loadImage("image/resultRyan.png");
  Taylor = loadImage("image/resultTaylor.png");
  Chad = loadImage("image/resultChad.png");

  Start = loadImage("image/startpage.png");
  bckgd = loadImage("image/background.png");
  inst = loadImage("image/instruction.png");

  switch1 = new Switch(width/15 + 20, height/3, 250, 150);
  switch2 = new Switch(width/3 + 50, height/3, 250, 150);
  switch3 = new Switch(width/2 + 200, height/3, 250, 150);
  switch4 = new Switch(width/15 + 20, height/3 + 3*switch1.switchHeight/2, 250, 150);
  switch5 = new Switch(width/3 + 50, height/3 + 3*switch1.switchHeight/2, 250, 150);
  switch6 = new Switch(width/2 + 200, height/3 + 3*switch1.switchHeight/2, 250, 150);


  for (int i=0; i<11; i++) {
    answers[i][0] = troy [i];
    answers[i][1] = gabriella [i];
    answers[i][2] = sharpay [i];
    answers[i][3] = ryan [i];
    answers[i][4] = taylor [i];
    answers[i][5] = chad [i];
  }

  shuffle[0] = shuffle1;
  shuffle[1] = shuffle2;
  shuffle[2] = shuffle3;
  shuffle[3] = shuffle4;
  shuffle[4] = shuffle5;
  shuffle[5] = shuffle6;
  shuffle[6] = shuffle7;
  shuffle[7] = shuffle8;
  shuffle[8] = shuffle9;
  shuffle[9] = shuffle10;
  shuffle[10] = shuffle11;

  for (int i = 0; i<6; i++) {
    shuffle[0].append(answers[0][i]);
    shuffle[1].append(answers[1][i]);
    shuffle[2].append(answers[2][i]);
    shuffle[3].append(answers[3][i]);
    shuffle[4].append(answers[4][i]);
    shuffle[5].append(answers[5][i]);
    shuffle[6].append(answers[6][i]);
    shuffle[7].append(answers[7][i]);
    shuffle[8].append(answers[8][i]);
    shuffle[9].append(answers[9][i]);
    shuffle[10].append(answers[10][i]);
  }

  for (int i=0; i<11; i++) {
    shuffle[i].shuffle();
    shuffle[i].shuffle();
    shuffle[i].shuffle();
  }


  scoreList = new IntList();
}

void draw() {

  start.display();

  if (gameStart) {
    switch1.update(choice1);    
    switch1.display();
    switch2.update(choice2);    
    switch2.display();
    switch3.update(choice3);
    switch3.display();
    switch4.update(choice4);
    switch4.display();
    switch5.update(choice5);
    switch5.display();
    switch6.update(choice6);
    switch6.display();

    if (page1) {
      textFont(font, 35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question1, width/2, height/8);

      String one1 = shuffle[0].get(0);
      String two1 = shuffle[0].get(1);
      String three1 = shuffle[0].get(2);
      String four1 = shuffle[0].get(3);
      String five1 = shuffle[0].get(4);
      String six1 = shuffle[0].get(5);

      textFont(font,25);
      fill(0);

      text(one1, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two1, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three1, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four1, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five1, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six1, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one1, 1);
        page2 = true; 
        page1 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two1, 1);
        page2 = true; 
        page1 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three1, 1);
        page2 = true; 
        page1 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four1, 1);
        page2 = true; 
        page1 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five1, 1);
        page2 = true; 
        page1 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six1, 1);
        page2 = true; 
        page1 = false;
      }
    } else if (page2) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question2, width/2, height/8);

      String one2 = shuffle[0].get(0);
      String two2 = shuffle[0].get(1);
      String three2 = shuffle[0].get(2);
      String four2 = shuffle[0].get(3);
      String five2 = shuffle[0].get(4);
      String six2 = shuffle[0].get(5);

      textFont(font,25);
      fill(0);

      text(one2, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two2, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three2, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four2, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five2, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six2, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one2, 1);
        page3 = true; 
        page2 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two2, 1);
        page3 = true; 
        page2 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three2, 1);
        page3 = true; 
        page2 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four2, 1);
        page3 = true; 
        page2 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five2, 1);
        page3 = true; 
        page2 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six2, 1);
        page3 = true; 
        page2 = false;
      }
    } else if (page3) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question3, width/2, height/8);

      String one3 = shuffle[0].get(0);
      String two3 = shuffle[0].get(1);
      String three3 = shuffle[0].get(2);
      String four3 = shuffle[0].get(3);
      String five3 = shuffle[0].get(4);
      String six3 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one3, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two3, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three3, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four3, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five3, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six3, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one3, 1);
        page4 = true; 
        page3 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two3, 1);
        page4 = true; 
        page3 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three3, 1);
        page4 = true; 
        page3 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four3, 1);
        page4 = true; 
        page3 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five3, 1);
        page4 = true; 
        page3 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six3, 1);
        page4 = true; 
        page3 = false;
      }
    } else if (page4) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question4, width/2, height/8);

      String one4 = shuffle[0].get(0);
      String two4 = shuffle[0].get(1);
      String three4 = shuffle[0].get(2);
      String four4 = shuffle[0].get(3);
      String five4 = shuffle[0].get(4);
      String six4 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one4, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two4, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three4, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four4, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five4, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six4, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one4, 1);
        page5 = true; 
        page4 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two4, 1);
        page5 = true; 
        page4 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three4, 1);
        page5 = true; 
        page4 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four4, 1);
        page5 = true; 
        page4 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five4, 1);
        page5 = true; 
        page4 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six4, 1);
        page5 = true; 
        page4 = false;
      }
    } else if (page5) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question5, width/2, height/8);

      String one5 = shuffle[0].get(0);
      String two5 = shuffle[0].get(1);
      String three5 = shuffle[0].get(2);
      String four5 = shuffle[0].get(3);
      String five5 = shuffle[0].get(4);
      String six5 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one5, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two5, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three5, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four5, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five5, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six5, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one5, 1);
        page6 = true; 
        page5 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two5, 1);
        page6 = true; 
        page5 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three5, 1);
        page6 = true; 
        page5 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four5, 1);
        page6 = true; 
        page5 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five5, 1);
        page6 = true; 
        page5 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six5, 1);
        page6 = true; 
        page5 = false;
      }
    } else if (page6) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question6, width/2, height/8);

      String one6 = shuffle[0].get(0);
      String two6 = shuffle[0].get(1);
      String three6 = shuffle[0].get(2);
      String four6 = shuffle[0].get(3);
      String five6 = shuffle[0].get(4);
      String six6 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one6, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two6, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three6, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four6, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five6, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six6, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one6, 1);
        page7 = true; 
        page6 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two6, 1);
        page7 = true; 
        page6 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three6, 1);
        page7 = true; 
        page6 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four6, 1);
        page7 = true; 
        page6 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five6, 1);
        page7 = true; 
        page6 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six6, 1);
        page7 = true; 
        page6 = false;
      }
    } else if (page7) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question7, width/2, height/8);

      String one7 = shuffle[0].get(0);
      String two7 = shuffle[0].get(1);
      String three7 = shuffle[0].get(2);
      String four7 = shuffle[0].get(3);
      String five7 = shuffle[0].get(4);
      String six7 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one7, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two7, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three7, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four7, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five7, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six7, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one7, 1);
        page8 = true; 
        page7 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two7, 1);
        page8 = true; 
        page7 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three7, 1);
        page8 = true; 
        page7 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four7, 1);
        page8 = true; 
        page7 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five7, 1);
        page8 = true; 
        page7 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six7, 1);
        page8 = true; 
        page7 = false;
      }
    } else if (page8) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question8, width/2, height/8);

      String one8 = shuffle[0].get(0);
      String two8 = shuffle[0].get(1);
      String three8 = shuffle[0].get(2);
      String four8 = shuffle[0].get(3);
      String five8 = shuffle[0].get(4);
      String six8 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one8, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two8, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three8, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four8, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five8, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six8, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one8, 1);
        page9 = true; 
        page8 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two8, 1);
        page9 = true; 
        page8 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three8, 1);
        page9 = true; 
        page8 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four8, 1);
        page9 = true; 
        page8 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five8, 1);
        page9 = true; 
        page8 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six8, 1);
        page9 = true; 
        page8 = false;
      }
    } else if (page9) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question9, width/2, height/8);

      String one9 = shuffle[0].get(0);
      String two9 = shuffle[0].get(1);
      String three9 = shuffle[0].get(2);
      String four9 = shuffle[0].get(3);
      String five9 = shuffle[0].get(4);
      String six9 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one9, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two9, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three9, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four9, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five9, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six9, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one9, 1);
        page10 = true; 
        page9 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two9, 1);
        page10 = true; 
        page9 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three9, 1);
        page10 = true; 
        page9 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four9, 1);
        page10 = true; 
        page9 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five9, 1);
        page10 = true; 
        page9 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six9, 1);
        page10 = true; 
        page9 = false;
      }
    } else if (page10) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question10, width/2, height/8);

      String one10 = shuffle[0].get(0);
      String two10 = shuffle[0].get(1);
      String three10 = shuffle[0].get(2);
      String four10 = shuffle[0].get(3);
      String five10 = shuffle[0].get(4);
      String six10 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one10, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two10, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three10, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four10, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five10, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six10, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one10, 1);
        page11 = true; 
        page10 = false;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two10, 1);
        page11 = true; 
        page10 = false;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three10, 1);
        page11 = true;
        page10 = false;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four10, 1);
        page11 = true; 
        page10 = false;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five10, 1);
        page11 = true; 
        page10 = false;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six10, 1);
        page11 = true; 
        page10 = false;
      }
    } else if (page11) {
      textSize(35);
      textAlign(CENTER, CENTER);
      fill(255);
      text(question11, width/2, height/8);

      String one11 = shuffle[0].get(0);
      String two11 = shuffle[0].get(1);
      String three11 = shuffle[0].get(2);
      String four11 = shuffle[0].get(3);
      String five11 = shuffle[0].get(4);
      String six11 = shuffle[0].get(5);

      textSize(25);
      fill(0);

      text(one11, switch1.switchX, switch1.switchY, switch1.switchWidth - 20, switch1.switchHeight-10);
      text(two11, switch2.switchX, switch2.switchY, switch2.switchWidth - 20, switch2.switchHeight-10);
      text(three11, switch3.switchX, switch3.switchY, switch3.switchWidth - 20, switch3.switchHeight-10);
      text(four11, switch4.switchX, switch4.switchY, switch4.switchWidth - 20, switch4.switchHeight-10);
      text(five11, switch5.switchX, switch5.switchY, switch5.switchWidth - 20, switch5.switchHeight-10);
      text(six11, switch6.switchX, switch6.switchY, switch6.switchWidth - 20, switch6.switchHeight-10);

      if (choice1 == 1 && !(choice2 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(one11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      } else if (choice2 == 1 && !(choice1 == 1 || choice3 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(two11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      } else if (choice3 == 1 && !(choice1 == 1 || choice2 == 1 || choice4 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(three11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      } else if (choice4 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice5 == 1|| choice6 == 1)) {
        scoreCheck.count(four11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      } else if (choice5 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice6 == 1)) {
        scoreCheck.count(five11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      } else if (choice6 == 1 && !(choice1 == 1 || choice2 == 1 || choice3 == 1 || choice4 == 1|| choice5 == 1)) {
        scoreCheck.count(six11, 1);
        page11 = false;
        gameStart = false;
        gameEnd = true;
      }
    } else if (gameEnd && !gameStart) {
      scoreList.append(scoreTroy);
      scoreList.append(scoreGabriella);
      scoreList.append(scoreSharpay);
      scoreList.append(scoreRyan);
      scoreList.append(scoreTaylor);
      scoreList.append(scoreChad);

      if (scoreList.max() == scoreTroy.get(0)) {
        end.displayTroy();
      } else if (scoreList.max() == scoreGabriella.get(0)) {
        end.displayTroy();
      } else if (scoreList.max() == scoreSharpay.get(0)) {
        end.displayTroy();
      } else if (scoreList.max() == scoreRyan.get(0)) {
        end.displayTroy();
      } else if (scoreList.max() == scoreTaylor.get(0)) {
        end.displayTroy();
      } else if (scoreList.max() == scoreChad.get(0)) {
        end.displayTroy();
      }
    }
  }
}


void erase() {
  image(bckgd, 0, 0, width, height);
}

void mouseClicked() {
  start.displayStart();
  instruction.displayHow();
}

void serialEvent(Serial myPort) {
  
  String s=myPort.readStringUntil('\n');
  s=trim(s);
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));
    if (values.length==7) {
      choice1 = (int)values[0];
      choice2 = (int)values[1];
      choice3 = (int)values[2];
      choice4 = (int)values[3];
      choice5 = (int)values[4];
      choice6 = (int)values[5];
    }
  }
  myPort.write(choice1+","+choice2+","+choice3+","+choice4+","+choice5+","+choice6+"\n");
}
