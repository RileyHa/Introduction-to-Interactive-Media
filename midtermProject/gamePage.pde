class gamePage {

  boolean hasIngBeenPicked = false;
  int ingX, ingY;
  int ingSpeed;
  int pick;

  ArrayList<Integer> ingOnBun = new ArrayList<Integer>();
  ArrayList<Integer> customerOrder = new ArrayList<Integer>();

  void getOrder() {
    for (int i=0; i<5; i++) {
      customerOrder.add(int(random(0, 3)));
    }
  }

  void setup() {

    ingX = int(random(0, width-90));
    ingY = -20;
    ingSpeed = int(random(30, 40));
  }

  void pickIng() {
    if (!hasIngBeenPicked) {
      hasIngBeenPicked = true;
      setup();
      fall();
      pick = int(random(0, 6));
    }
  }

  void drawIng() {
    if (pick == 0) {
      image(beef, ingX, ingY);
    } else if (pick == 1) {
      image(cheese, ingX, ingY);
    } else if (pick == 2) {
      image(lettuce, ingX, ingY);
    } else if (pick == 3) {
      image(sauce, ingX, ingY);
    } else if (pick == 4) {
      image(tomato, ingX, ingY);
    } else if (pick == 5) {
      image(topbun, ingX, ingY);
    }
  }

  void display() {
    if (gameStart) {
      image(background, 0, 0);

      textSize(50);
      fill(0);
      text(customerOrder.get(0), 80, 160);
      text(customerOrder.get(1), 210, 160);
      text(customerOrder.get(2), 340, 160);
      text(customerOrder.get(3), 470, 160);
      text(customerOrder.get(4), 600, 160);

      image(bottom, mouseX-41.5, 850);
      int ing;
      for (int i=0; i<ingOnBun.size(); i++) {
        ing = ingOnBun.get(i);
        if (ing == 0) {
          image(beef, mouseX-41.5, 850 - i * 20);
        } else if (ing == 1) {
          image(cheese, mouseX-41.5, 850 - i * 20);
        } else if (ing == 2) {
          image(lettuce, mouseX-41.5, 850 - i * 20);
        } else if (ing == 3) {
          image(sauce, mouseX-41.5, 850 - i * 20);
        } else if (ing == 4) {
          image(tomato, mouseX-41.5, 850 - i * 20);
        } else if (ing == 5) {
          image(topbun, mouseX-41.5, 850 - i * 20);
        }
      }
    }
  }

  void fall() {
    ingY = ingY + ingSpeed;
  }

  void check() { 
    if (ingY > height) { // checking if the ingredient has fallen out of the screen
      hasIngBeenPicked = false;
    } 
    if ((mouseX-120<ingX && ingX<mouseX+40)&&(810 - 20 * ingOnBun.size() <ingY && ingY< 890 - 20 * ingOnBun.size())) {  
      if (pick == 5) { // if the player picked the topbun
        finishBurger();
      } else {
        ingOnBun.add(pick);
        hasIngBeenPicked = false;
      }
    }
  }

  void finishBurger() {
    int countBeef = Collections.frequency(ingOnBun, 0);
    print(countBeef);
    int countCheese = Collections.frequency(ingOnBun, 1);
    print(countCheese);
    int countLettuce = Collections.frequency(ingOnBun, 2);
    print(countLettuce);
    int countSauce = Collections.frequency(ingOnBun, 3);
    print(countSauce);
    int countTomato = Collections.frequency(ingOnBun, 4);
    print(countTomato);

    if ((customerOrder.get(0) == countBeef)&& (customerOrder.get(1) == countCheese) && (customerOrder.get(2) == countLettuce) && (customerOrder.get(3) == countSauce) && (customerOrder.get(4) == countTomato)) {
      chaching.play();
      earn = earn + 10;
      resetGame();
    } else {
      gameEnd = true;
    }
  }

  void resetGame() {
    ingOnBun = new ArrayList<Integer>();
    customerOrder = new ArrayList<Integer>();
    pick = -1;
    hasIngBeenPicked = false;
    getOrder();
  }
}
