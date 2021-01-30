/* 
 This is my second version of the second assignment for Intro to IM
 Assignment: Computer Graphic Art
 
 This program was written by Chaehyun Ha
 30 January 2021
 */

//concept = space


void setup() {
  background(0, 0, 0);
  size(800, 600);
}

void draw() {
  for (int initial=1; initial<10; initial++) {
    float location= random(0, width);
    float len = random(0, height);

    if (mousePressed) {
      strokeWeight(random(0, 3));
      stroke(random(0, 255), random(0, 255), random(0, 255));
      circle(location, len, random(0, 5));
      //line(location,len,location,len);
    } else {
      background(0, 0, 0);
      clear();
    }
  }
}
