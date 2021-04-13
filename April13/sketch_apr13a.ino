const int buttonPIN = 2;
const int potenPIN = A0;
const int photoPIN = A1;
const int yellowPIN = 4;

int poten = 0;
int photo = 0;
int button = 0;
int inByte = 0;


void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);

  while(!Serial){
    ;
  }

  pinMode(buttonPIN, INPUT);

  pinMode(yellowPIN, OUTPUT);

  establishContact();

}

void loop() {
  // put your main code here, to run repeatedly:

  if (Serial.available() > 0) {

    inByte = Serial.read();

    if (inByte == 'A') {

      poten = analogRead(potenPIN);

      photo = analogRead(photoPIN);

      button = map(digitalRead(buttonPIN), 0, 1, 0, 255);

      Serial.print(poten);
      Serial.print(photo);
      Serial.print(button);
      
    }

    if (inByte == 'Y'){

      digitalWrite (yellowPIN, HIGH);
    }
  }

  

}

void establishContact() {
  
  while (Serial.available() <= 0) {
    
    Serial.println("0,0,0");
    
    delay(300);
    
  }
}
