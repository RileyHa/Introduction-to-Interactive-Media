/* Chaehyun Riley Ha
 * Assignment for March 30
 * Intro to IM _ Analog & Digital
 * 
 * Instructions
 * 1. Press the switch to turn off all the lights
 * 2. One person changes (adjusts) the potentiometer
 * 3. The other person should guess what light color would be turned on if the switch is released!
 * 
 */

// variable declaration for LEDs

const int redLED = 9;
const int yellowLED = 6;
const int greenLED = 5;
const int blueLED = 3;

// variable declaration for switch

const int mySwitch = 11;

// Setting up the code

void setup() {
  
  Serial.begin(9600);

  //setting the switch as input
  pinMode(mySwitch, INPUT_PULLUP);

  //setting the LEDs as output
  pinMode(redLED, OUTPUT);
  pinMode(yellowLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
  pinMode(blueLED, OUTPUT);
  
}

void loop() {
  
  // get value of the potentiometer using analogRead
  
  int potVal = analogRead (A1);
  
  // get switch state (if pressed or released) using digitalRead
  
  int switchPressed = digitalRead(mySwitch);
  
  delay(1);

  // turn on Red light if sensor value is between 0 and 250
  
  if ((potVal > 0) && (potVal < 250)) {
    analogWrite (redLED, 100);
    analogWrite (yellowLED, 0);
    analogWrite (greenLED, 0);
    analogWrite (blueLED, 0);
  }
  
  // turn on Yellow light if sensor value is between 250 and 500  
  
  else if ((potVal > 250) && (potVal < 500)) {
    analogWrite (redLED, 0);
    analogWrite (yellowLED, 100);
    analogWrite (greenLED, 0);
    analogWrite (blueLED, 0);
  }
  
  // turn on Green light if sensor value is between 500 and 750
  
  else if ((potVal > 500) && (potVal < 750)) {
    analogWrite (redLED, 0);
    analogWrite (yellowLED, 0);
    analogWrite (greenLED, 100);
    analogWrite (blueLED, 0);
  }
  
  // turn on Blue light if sensor value is over 750
  
  else if (potVal > 750) {
    analogWrite (redLED, 0);
    analogWrite (yellowLED, 0);
    analogWrite (greenLED, 0);
    analogWrite (blueLED, 100);
  }
  
  //turn all LED's OFF when button is pressed
  
  if (switchPressed == HIGH)  {
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, HIGH);
    digitalWrite(greenLED, HIGH);
    digitalWrite(blueLED, HIGH);
  }
}
