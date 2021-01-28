/* 
This is my first homework for Intro to IM
Assignment: Self-Portrait

This program was written by Chaehyun Ha
21 January 2021
*/

size(800,800);
background(color(204, 204, 255));

//Hair
fill(153, 102, 51);
stroke(153, 102, 51);
ellipse(400,270,350,500);
ellipse (250, 400, 100, 250);
ellipse (550, 400, 100, 250);


//Face
fill(255,255,255);
noStroke();
int faceWidth = 250;
int faceHeight = 300;
ellipse(width/2, height/4, faceWidth, faceHeight);

//Bangs
fill(153, 102, 51);
stroke(153, 102, 51);
rect(350,50, 10, 100);
rect(370,50, 10, 100);
rect(390,50, 10, 100);
rect(410,50, 10, 100);
rect(430,50, 10, 100);

//Ears
fill(255,255,255);
noStroke();
ellipse(width/2 -125, height/5 + 50, 20, 50);
ellipse(width/2 + 125, height/5 + 50, 20, 50);

//Eyebrows
fill(0,0,0);
stroke(0,0,0);
rect(width/2 -80, height/5, 60, 10);
rect(width/2 + 10, height/5, 60, 10);

//Eyes
noFill();
stroke(0,0,0);
circle(width/2 - 50, height/5 + 50, 50);
circle(width/2 + 40, height/5 + 50, 50);
fill(0,0,0);
circle(width/2 - 50, height/5 + 50, 20);
circle(width/2 + 40, height/5 + 50, 20);

//Nose
noFill();
stroke(0,0,0);
circle(width/2, height/5 + 80, 30);

//Mouth
fill(255,192,203);
noStroke();
arc(width/2, height/5 + 110, 80, 80, 0, PI, CHORD);


//Body
int bodyHeight = 400;
fill(253, 253, 150);
noStroke();
rect(width/2 -150, height/4 +150, faceWidth + 50, bodyHeight, 500, 500, 10, 10);
