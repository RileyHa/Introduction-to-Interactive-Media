//LED Lights

const int rLED = 10;
const int yLED = 8;
const int gLED = 6;
const int bLED = 4;

//Target number (aim)

long target;

//Buttons

const byte rSwitch = A0;
const byte ySwitch = A1;
const byte gSwitch = A2;
const byte bSwitch = A3;

//Counter that keeps track of number added

byte counter = 0;

// 1 = red, 2 = yellow, 3 = green, 4 = blue

int switch1 = 0;
int switch2 = 0;
int switch3 = 0;
int switch4 = 0;

// boolean to start game

boolean gamestart = true;


void setup() {

  //setting LED as output

  pinMode(bLED, OUTPUT);
  pinMode(gLED, OUTPUT);
  pinMode(yLED, OUTPUT);
  pinMode(rLED, OUTPUT);

  //setting buttons as input

  pinMode(rSwitch, INPUT);
  pinMode(ySwitch, INPUT);
  pinMode(gSwitch, INPUT);
  pinMode(bSwitch, INPUT);

  // initializing target number

  target = random(1, 30);

  Serial.begin(9600);

  // printing out target number on the serial board
  
  Serial.println(target);
}

void loop() {
  gamePlay();
}


void gamePlay() {

  while (gamestart) {

    int switch1 = digitalRead(rSwitch);
    int switch2 = digitalRead(ySwitch);
    int switch3 = digitalRead(gSwitch);
    int switch4 = digitalRead(bSwitch);

    if (switch1 == HIGH) {
    
      counter += 1;
      digitalWrite(rLED, HIGH);
      delay(250);
      digitalWrite(rLED, LOW);
    
    }

    if (switch2 == HIGH) {
      
      counter += 2;
      digitalWrite(yLED, HIGH);
      delay(250);
      digitalWrite(yLED, LOW);
    
    }

    if (switch3 == HIGH) {
      
      counter += 5;
      digitalWrite(gLED, HIGH);
      delay(250);
      digitalWrite(gLED, LOW);
    
    }

    if (switch4 == HIGH) {
      
      counter += 10;
      digitalWrite(bLED, HIGH);
      delay(250);
      digitalWrite(bLED, LOW);
    
    }

    if (counter == target) {
      
      digitalWrite(rLED, HIGH);
      digitalWrite(yLED, HIGH);
      digitalWrite(gLED, HIGH);
      digitalWrite(bLED, HIGH);
      
      delay(1000);
      
      digitalWrite(rLED, LOW);
      digitalWrite(yLED, LOW);
      digitalWrite(gLED, LOW);
      digitalWrite(bLED, LOW);
      
      Serial.println("Success!");
      
      gamestart = false;
    
    }
  }
