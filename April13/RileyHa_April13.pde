
import processing.sound.*;
SoundFile file;

import processing.serial.*;
Serial myPort;


PImage cone;
PImage icecream;

float xpos;
float ypos;


void setup() {

  // serial:

  myPort = new Serial(this, Serial.list()[1], 9600);

  myPort.bufferUntil('\n');

  // sound file:
  file = new SoundFile(this, "tada.wav");

  // images:
  cone = loadImage("cone1.png");
  icecream = loadImage("icecream1.png");


  size(1200, 1200);

  imageMode(CENTER);
}



void draw() {

  drawBackground();

  image(icecream, xpos, ypos);
}



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


  if (xpos <= 400 && xpos >= 450 && ypos <= 300 && ypos >= 370) {

    myPort.write("Y");
    noLoop();
  }
}



void drawBackground() {

  background(255);
  image(cone, width/2, height/2);
  
}
