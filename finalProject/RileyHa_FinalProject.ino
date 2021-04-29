int choice1 = 0;
int choice2 = 0;
int choice3 = 0;
int choice4 = 0;

int one = 7;
int two = 6;
int three = 5;
int four = 4;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("0,0,0");

  pinMode(one, INPUT);
  pinMode(two, INPUT);
  pinMode(three, INPUT);
  pinMode(four, INPUT);
  pinMode(five, INPUT);
  pinMode(six, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  while (Serial.available()) {
    choice1 = Serial.parseInt();
    choice2 = Serial.parseInt();
    choice3 = Serial.parseInt();
    choice4 = Serial.parseInt();
    choice5 = Serial.parseInt();
    choice6 = Serial.parseInt();

    if (Serial.read() == '\n') {
      int button1 = analogRead(A0);
      delay(1);
      int button2 = analogRead(A1);
      delay(1);
      int button3 = analogRead(A3);
      delay(1);
      int button4 = analogRead(A4);
      delay(1);

      Serial.print(button1);
      Serial.print(",");
      Serial.print(button2);
      Serial.print(",");
      Serial.print(button3);
      Serial.print(",");
      Serial.print(button4);
    }
  }
}
