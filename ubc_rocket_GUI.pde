import controlP5.*;
import processing.serial.*;
ControlP5 cp5;
Serial myPort;  // The serial port
String myString; // The reading from the Arduino
// Priming experiments
int primeOne = 0;
int primeTwo = 0;
int primeThree = 0;
// Limit switches
boolean limitOne = false;
boolean limitThree = false;
boolean limitFour = false;
boolean limitFive = false;
boolean limitSix = false;

void setup() {
  
  size(460, 200);
  
  cp5 = new ControlP5(this);
  
  // Create buttons for running the experiment 
  //  -> Prime buttons must be pressed before their corresponding experiment buttons
  
  cp5.addButton("Prime1")
             .setPosition(50,50)
             .setSize(120,30)
             ;
             
  cp5.addButton("Experiment1")
             .setPosition(50,100)
             .setSize(120,30)
             ;
             
  cp5.addButton("Prime2")
             .setPosition(170,50)
             .setSize(120,30)
             ;
             
  cp5.addButton("Experiment2")
             .setPosition(170,100)
             .setSize(120,30)
             ;
             
  cp5.addButton("Prime3")
             .setPosition(290,50)
             .setSize(120,30)
             ;
             
  cp5.addButton("Experiment3")
             .setPosition(290,100)
             .setSize(120,30)
             ;
  // List all the available serial ports in the console (can be commented out)
  printArray(Serial.list());
  // Open the port you are using at the rate you want (we are using COM4)
  myPort = new Serial(this, "COM4", 9600);
}
void draw() {
  
  // Maroon background
  background(128, 0, 0); 
 
  // Read for updates from the Arduino
  if (myPort.available() > 0){
    myString = myPort.readStringUntil('\n');       
    
    // Read the serial for updates regarding the limit swtiches
    if (myString.contains("4")) {
      limitOne = true;
    }
    else if(myString.contains("5")) {
      limitThree = true;
    }
    else if(myString.contains("6")) {
      limitFour = true;
    }
    else if(myString.contains("8")) {
      limitOne = false;
    }
    else if(myString.contains("9")) {
      limitThree = false;
    }
    else if(myString.contains("0")) {
      limitFour = false;
    }
    
    
  }// Stop checking the limit switches
  
  // Update GUI based on limit switch readings
  if(limitOne){
    fill(0, 255, 0);
    ellipse(50,150,10,10);
  }
  
  
  if(limitThree){
    fill(0, 255, 0);
    ellipse(170,150,10,10);
  }
  
  if(limitFour){
    fill(0, 255, 0);
    ellipse(195,150,10,10);
  }
  
  if(limitFive){
    fill(0, 255, 0);
    ellipse(290,150,10,10);
  }
  
  if(limitSix){
    fill(0, 255, 0);
    ellipse(315,150,10,10);
  }
  
  // Redraw GUI
  redraw();
}
// SECTION FOR BUTTON PRESSES
void Prime1() {
  primeOne = 1;
}
void Experiment1() {
  if(primeOne == 1) {
    myPort.write('1');
  } 
}
void Prime2() {
  primeTwo = 1;
}
void Experiment2() {
  if(primeTwo == 1) {
    myPort.write('2');
  } 
}
void Prime3() {
  primeThree = 1;
}
void Experiment3() {
  if(primeThree == 1) {
    myPort.write('3');
  } 
}
