ball myBall = new ball(250, 250, 16, #C1F3FF);
bar myBar = new bar(250, 450, 80, 6);
target myTarget = new target(#6C83FF);

boolean play = false;
boolean main = true;
boolean end = false;


int x_dir = 1;
int y_dir = 1;
int target_f = 0;

int score = 0;

void setup() {
  size(500, 500);
  myTarget.target_position(200, 200);
}

void draw() {
  background(#E0F9FF);
  
  if(play){
    bounce_wall();
    bounce_bar();
    bounce_target();

    myBall.ball_move(3*x_dir, 4*y_dir);
    myBar.bar_move(mouseX);
  }
  
  if(main){
    if(mousePressed){
      play = true;
      main = false;
      end = false;
      init_game();
    }
    textSize(40);
    fill(#080808);
    text("Press mouse to start",50,250);
  }
  
  if(end){
    if(mousePressed){
      play = false;
      main = true;
      end = false;
      delay(100);
    }
    textSize(20);
    fill(#080808);
    text("You have dropped the ball! Click to start again ",30,250);
  }

}

void bounce_target() {

  if (target_f == 0) {
    myTarget.target_position(int(random(450)), int(random(280)));
    target_f = 1;
  }

  if ((myTarget.x <= myBall.x+16)&&(myTarget.x+50 >= myBall.x+16)&&(myTarget.y <= myBall.y)&&(myTarget.y +20 >= myBall.x)) {
    target_f=0;
    x_dir *= -1;
    score+=1;
  }

  if ((myTarget.x <= myBall.x - 16) && (myTarget.x + 50 >= myBall.x - 16) && (myTarget.y <= myBall.y)&&(myTarget.y + 20 >= myBall.y)) {
    target_f=0;
    x_dir *= -1;
    score+=1;
  }

  if ((myTarget.x <= myBall.x)&&(myTarget.x+50 >= myBall.x)&&(myTarget.y <= myBall.y-16)&&(myTarget.y + 20 >= myBall.y-16)) {
    target_f=0;
    y_dir *= -1;
    score+=1;
  }

  if ((myTarget.x <= myBall.x)&&(myTarget.x+50 >= myBall.x)&&(myTarget.y <= myBall.y + 16)&&(myTarget.y + 20 >= myBall.y + 16)) {
    target_f=0;
    y_dir *= -1;
    score+=1;
  }
  
  textSize(30);
  fill(#5F5DFF);
  text(score, 20, 50);
  myTarget.target_draw();
}

void bounce_wall() {
  if (myBall.x >= width - 12) {
    x_dir *= -1;
  }
  if (myBall.x <= 0 + 12) {
    x_dir *= -1;
  }
  if (myBall.y >= width - 12) {
    y_dir *= -1;
    play = false;
    main = false;
    end = true;
    
  }
  if (myBall.y <= 0 + 12) {
    y_dir *= -1;
  }
}

void bounce_bar() {
  if ((myBar.x - 40 <= myBall.x + 12) && (myBar.x + 40 >= myBall.x - 12)) {
    if ((myBar.y - 3 <= myBall.y + 8) && (myBar.y + 3 >= myBall.y - 8)) {
      y_dir *= -1;
    }
  }
}

void init_game(){
  
  x_dir = 1;
  y_dir = 1;
  target_f = 0;
  
  score = 0;
  myBall.x = 250;
  myBall.y = 250;
  
}
