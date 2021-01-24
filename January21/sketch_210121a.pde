/* 
This is my first homework for Intro to IM
Assignment: Self-Portrait

This program was written by Chaehyun Ha
21 January 2021
*/

size(800,800);

//Face

int faceWidth = 250;
int faceHeight = 300;
ellipse(width/2, height/4, faceWidth, faceHeight);

//Ears
ellipse(width/2 -125, height/5 + 50, 20, 50);
ellipse(width/2 + 125, height/5 + 50, 20, 50);

//Eyebrows

rect(width/2 -80, height/5, 60, 10);
rect(width/2 + 10, height/5, 60, 10);

//Eyes
circle(width/2 - 50, height/5 + 50, 50);
circle(width/2 + 40, height/5 + 50, 50);
fill(0,0,0);
circle(width/2 - 50, height/5 + 50, 20);
circle(width/2 + 40, height/5 + 50, 20);

//Nose
noFill();
circle(width/2, height/5 + 80, 30);

//Mouth
fill(255,192,203);
arc(width/2, height/5 + 110, 80, 80, 0, PI, CHORD);


//Body
int bodyHeight = 400;
fill(253, 253, 150);
rect(width/2 -150, height/4 +150, faceWidth + 50, bodyHeight);
