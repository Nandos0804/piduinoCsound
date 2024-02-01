void setup() {
  // enable serial communication
  Serial.begin(9600);
}

void loop() {
  Serial.write(4);
  delay(2000);
  Serial.write(5);
  delay(2000);

}
