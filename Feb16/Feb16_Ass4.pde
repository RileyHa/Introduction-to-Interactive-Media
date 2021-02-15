//Introduction to Interactive Media Assignment 4: Data visualization & Generative Text
//Description: Use generative text function, create a personal health care system that guides and recommends your diet and exercises

//the list of in the form of cvs file (table)
Table workout1a, workout1b, workout2a, workout2b;

//image variable
PImage title, select, febe, fead, mabe, maad, title2;

//Font variable
PFont font1, font2;


//page number variable (used later)
int page=1;

//random text variables for workout courses
String cardio1a_r, core1a_r, legs1a_r, arms1a_r, stretch1a_r;
String cardio1b_r, core1b_r, legs1b_r, arms1b_r, stretch1b_r;
String cardio2a_r, legs2a_r, shoulders2a_r, abs2a_r, chest2a_r, back2a_r;
String cardio2b_r, legs2b_r, shoulders2b_r, abs2b_r, chest2b_r, back2b_r;


// Start of code

void setup(){
  
  background(255,255,255);
  size(600,600);
  
  font1 = loadFont("TsukuBRdGothic-Regular-48.vlw");
  font2 = loadFont("YuKyo-Medium-48.vlw");
  
  //images 
  title = loadImage("newtitle.png");
  select = loadImage("select.png");
  febe = loadImage("febe.png");
  fead = loadImage("fead.png");
  mabe = loadImage("mabe.png");
  maad = loadImage("maad.png");
  title2 = loadImage("workouttitle.png");
  
  
  
  //load csv file
  workout1a = loadTable("Female_Beginners.csv","header");
  workout1b = loadTable("Female_Advanced.csv","header");
  workout2a = loadTable("Male_Beginners.csv","header");
  workout2b = loadTable("Male_Advanced.csv","header");
  
  
  
  //1. beginner female - list & random string
  String cardio1a[] = workout1a.getStringColumn("Cardio");
  String core1a[] = workout1a.getStringColumn("Core");
  String legs1a[] = workout1a.getStringColumn("Legs");
  String arms1a[] = workout1a.getStringColumn("Arms");
  String stretch1a[] = workout1a.getStringColumn("Stretching");
  
  cardio1a_r = cardio1a[int(random(0,3))];
  core1a_r = core1a[int(random(0,3))];
  legs1a_r = legs1a[int(random(0,3))];
  arms1a_r = arms1a[int(random(0,3))];
  stretch1a_r = stretch1a[int(random(0,3))];
  
  
  
  //2. advanced female = list & random string
  String cardio1b[] = workout1b.getStringColumn("Cardio");
  String core1b[] = workout1b.getStringColumn("Core");
  String legs1b[] = workout1b.getStringColumn("Legs");
  String arms1b[] = workout1b.getStringColumn("Arms");
  String stretch1b[] = workout1b.getStringColumn("Stretching");
  
  cardio1b_r = cardio1b[int(random(0,3))];
  core1b_r = core1b[int(random(0,3))];
  legs1b_r = legs1b[int(random(0,3))];
  arms1b_r = arms1b[int(random(0,3))];
  stretch1b_r = stretch1b[int(random(0,3))];
  
  
  
  //3. beginner male - list & random string
  String cardio2a[] = workout2a.getStringColumn("Cardio");
  String legs2a[] = workout2a.getStringColumn("Legs");
  String shoulders2a[] = workout2a.getStringColumn("Shoulders");
  String abs2a[] = workout2a.getStringColumn("Abs");
  String chest2a[] = workout2a.getStringColumn("Chest");
  String back2a[] = workout2a.getStringColumn("Back");
  
  cardio2a_r = cardio2a[int(random(0,3))];
  legs2a_r = legs2a[int(random(0,3))];
  shoulders2a_r = shoulders2a[int(random(0,3))];
  abs2a_r = abs2a[int(random(0,3))];
  chest2a_r = chest2a[int(random(0,3))];
  back2a_r = back2a[int(random(0,3))];
  
  
  
  //4. advanced male - list & random string
  String cardio2b[] = workout2b.getStringColumn("Cardio");
  String legs2b[] = workout2b.getStringColumn("Legs");
  String shoulders2b[] = workout2b.getStringColumn("Shoulders");
  String abs2b[] = workout2b.getStringColumn("Abs");
  String chest2b[] = workout2b.getStringColumn("Chest");
  String back2b[] = workout2b.getStringColumn("Back");
  
  cardio2b_r = cardio2b[int(random(0,3))];
  legs2b_r = legs2b[int(random(0,3))];
  shoulders2b_r = shoulders2b[int(random(0,3))];
  abs2b_r = abs2b[int(random(0,3))];
  chest2b_r = chest2b[int(random(0,3))];
  back2b_r = back2b[int(random(0,3))];
  
}

// Start of draw function
void draw(){
  
  if (page == 1) { // starting page (first page)
    image(title,20,20,549,76);
    image(select,120,130,353,51);
    image(febe,140,250,123,73);
    image(fead,320,250,123,73);
    image(mabe,140,380,123,73);
    image(maad,320,380,123,73);
  }
  
  if (page == 2){
    background(255,255,255); // refresh page
    image(title2,20,20,549,76);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CARDIO (30 min)", 120, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(cardio1a_r, 120,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CORE (5*5 set)", 350, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(core1a_r, 350,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("LEGS (5*5 set)", 70, 350);
    
    textFont(font2,18);
    fill(0,0,0);
    text(legs1a_r, 70,400);
    
    textFont(font1,20);
    fill(#2f8045);
    text("ARMS (5*5 set)", 230, 450);
    
    textFont(font2,18);
    fill(0,0,0);
    text(arms1a_r, 230,500);
    
    textFont(font1,20);
    fill(#2f8045);
    text("STRETCHING", 400, 350);
    
    textFont(font2,18);
    fill(0,0,0);
    text(stretch1a_r, 400,400);
    
  }
  
  if (page == 3){
    background(255,255,255);
    image(title2,20,20,549,76);
    
    background(255,255,255); // refresh page
    image(title2,20,20,549,76);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CARDIO (1 hr)", 120, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(cardio1b_r, 120,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CORE (5*10 set)", 350, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(core1b_r, 350,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("LEGS (5*10 set)", 70, 350);
    
    textFont(font2,18);
    fill(0,0,0);
    text(legs1b_r, 70,400);
    
    textFont(font1,20);
    fill(#2f8045);
    text("ARMS (5*10 set)", 220, 450);
    
    textFont(font2,18);
    fill(0,0,0);
    text(arms1b_r, 220,500);
    
    textFont(font1,20);
    fill(#2f8045);
    text("STRETCHING", 400, 350);
    
    textFont(font2,18);
    fill(0,0,0);
    text(stretch1b_r, 400,400);
    
  }
  
  if (page == 4){
    background(255,255,255);
    image(title2,20,20,549,76);
    
    background(255,255,255); // refresh page
    image(title2,20,20,549,76);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CARDIO (30 min)", 70, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(cardio2a_r, 70,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("SHOULDERS (5*5 set)", 280, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(shoulders2a_r, 280,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("LEGS (5*5 set)", 70, 300);
    
    textFont(font2,18);
    fill(0,0,0);
    text(legs2a_r, 70,350);
    
    textFont(font1,20);
    fill(#2f8045);
    text("ABS (5*5 set)", 280, 300);
    
    textFont(font2,18);
    fill(0,0,0);
    text(abs2a_r, 280,350);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CHEST (5*5 set)", 70, 420);
    
    textFont(font2,18);
    fill(0,0,0);
    text(chest2a_r, 70,470);
    
    textFont(font1,20);
    fill(#2f8045);
    text("BACK (5*5 set)", 280, 420);
    
    textFont(font2,18);
    fill(0,0,0);
    text(back2a_r, 280,470);
    
  }
  
  if (page == 5){
    background(255,255,255);
    image(title2,20,20,549,76);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CARDIO (1 hr)", 70, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(cardio2b_r, 70,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("SHOULDERS (5*10 set)", 300, 180);
    
    textFont(font2,18);
    fill(0,0,0);
    text(shoulders2b_r, 300,230);
    
    textFont(font1,20);
    fill(#2f8045);
    text("LEGS (5*10 set)", 70, 300);
    
    textFont(font2,18);
    fill(0,0,0);
    text(legs2b_r, 70,350);
    
    textFont(font1,20);
    fill(#2f8045);
    text("ABS (5*10 set)", 300, 300);
    
    textFont(font2,18);
    fill(0,0,0);
    text(abs2b_r, 300,350);
    
    textFont(font1,20);
    fill(#2f8045);
    text("BACK (5*10 set)", 300, 420);
    
    textFont(font2,18);
    fill(0,0,0);
    text(back2b_r, 300,470);
    
    textFont(font1,20);
    fill(#2f8045);
    text("CHEST (5*10 set)", 70, 420);
    
    textFont(font2,18);
    fill(0,0,0);
    text(chest2b_r, 70,460,180,100);
    
  }
  
    
}


//When user clicks an option (out of 4)

void mouseClicked(){
  if ((mouseX > 140 && mouseX < 263) && (mouseY > 250 && mouseY < 323)){
    page = 2;
  }
  if ((mouseX > 320 && mouseX < 443) && (mouseY > 250 && mouseY < 323)){
    page = 3;
  }
  if ((mouseX > 140 && mouseX < 263) && (mouseY > 380 && mouseY < 453)){
    page = 4;
  }
  if ((mouseX > 320 && mouseX < 443) && (mouseY > 380 && mouseY < 453)){
    page = 5;
  }
}
