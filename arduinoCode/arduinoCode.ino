void setup() {
  // enable serial communication
  Serial.begin(9600);
}

void loop() {
  Serial.write("440");
  delay(2000);
  Serial.write("880");
  delay(2000);

}