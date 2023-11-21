
Background Background1;
boolean startScreen;
boolean gameOver;

void setup() {
  size(900, 600); //set canvas size to a landscape rectangle
  
  noStroke(); //no outline on shapes
  
  frameRate(30); //frame rate at 30
  
  Background1 = new Background();
  
}

void draw(){
  if (startScreen) {
    startScreenOn();
  }
  else if (gameOver) {
    gameOverOn();
  }
  else {
    gamePlaying();
  }
  
  
}

void startScreenOn() {
 //reset all the values to the default
 //draw flame background
 //draw text
 //draw button and add functions to it, so when mousePressed set startScreen to false
}

void gamePlaying() {
 //call draw background 
 // draw the brushes
 //draw the strike symbols
 //draw differnet cat faces
}

void gameOverOn() {
  //call draw background but cat bite hand
  //draw game over text
  //draw reset button, when mousePressed set gameOver to false and startScreen to true
}
