// #include "pitches.h"

int photoresistor = A0;
int yellowButton = A2;
int speakerPort = 8;


void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);

  // Setting up the necessary pins
  pinMode(photoresistor, INPUT);
  pinMode(yellowButton, INPUT);
  pinMode(speakerPort, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:

  // taking the photoresistor input as an int variable
  int note = analogRead(photoresistor);

  //mapping from range of photoresistor input to range of frequencies in pitches
  note = map(note, 0, 1023, 1047, 31);

  //play note at frequency give by input and map function if the switch is pressed
  if (digitalRead(yellowButton) == HIGH){
    tone(speakerPort, note);
  }

  //otherwise don't play
  else{
    noTone(speakerPort);
  }

}
