/* 
 This is my second assignment for Intro to IM
 Assignment: Computer Graphic Art
 
 This program was written by Chaehyun Ha
 30 January 2021
 */

//concept = broken TV monitor


void setup() {
  background(0, 0, 0);
  size(800, 600);
}

void draw() {
  for (int initial=1; initial<5; initial++) {
    float location= random(0, width);
    float len = random(0, height);

    if (mousePressed) {
      strokeWeight(random(0, 5));
      stroke(random(0, 255), random(0, 255), random(0, 255));
      line(location, len, location, random(0, height));
    } else {
      background(0, 0, 0);
      stroke(random(0, 255), random(0, 255), random(0, 255));
      circle(location, random(0, height), 3);
      line(location, random(0, height), location, random(0, height));
    }
  }
}
