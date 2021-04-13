// Import stuff here, and declare their varibales:

import processing.sound.*;
SoundFile file;

import processing.serial.*;
Serial myPort;


PImage cone;
PImage icecream;

float xpos;
float ypos;


void setup() {

  // code part for serial:

  myPort = new Serial(this, Serial.list()[1], 9600);

  myPort.bufferUntil('\n');

  // import sound file:
  //file = new SoundFile(this, "money.wav");

  // import images:
  cone = loadImage("cone1.png");
  icecream = loadImage("icecream1.png");


  size(1200, 1200);

  imageMode(CENTER);
}



void draw() {

  drawBackground();

  image(icecream, xpos, ypos);
}


// contact with arduino:

void serialEvent(Serial myPort) {

  String myString = myPort.readStringUntil('\n');
  myString = trim(myString);

  int sensors[] = int(split(myString, ','));

  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }

  println();


  if (sensors.length > 1 && sensors[2] == 255) {
    xpos = map(sensors[1], 0, 1023, 0, width);
    ypos = map(sensors[2], 0, 1023, 0, height);
  }

  myPort.write("A"); 


  if (xpos <= 270 && xpos >= 230 && ypos <= 190 && ypos >= 100) {

    myPort.write("Y");
    noLoop();
  }
}



void drawBackground() {
  background(255);
  image(cone, width/2, height/2);
}
