/* Cat Petter 2000 created by Charlotte Hicken 



*/

PImage flameImg;
Background Background1;
CatFace CatFace1;
boolean startScreen;
boolean gameOver;
int distance;
enum GameState {START, GAMEOVER, GAMEPLAY};
GameState currentState = GameState.START;

void setup() {
  size(900, 600); //set canvas size to a landscape rectangle
  
  noStroke(); //no outline on shapes
  textAlign(CENTER, CENTER);
  
  frameRate(30); //frame rate at 30
  
  Background1 = new Background();
  flameImg = loadImage("Flame.jpg");
  
  CatFace1 = new CatFace();
  
  startScreen = true;
  gameOver = false;
  
  rectMode(CORNERS);
}

void draw(){
  
  switch(currentState) {
    case START:
      startScreenOn();
      break;
    case GAMEOVER:
      gameOverOn();
      break;
    case GAMEPLAY:
      gamePlaying();
      break;
  }
  
  //testing feature that will be commented out at the end
  if (mousePressed) { //if mouse is pressed, print the coordinates of where it was pressed
   println(mouseX + ", " + mouseY); 
  }
  
}

void startScreenOn() {
  //reset all the values to the default
  gameOver = false;
  //draw flame background
  background(flameImg); //sets the background to the flame image
  
  //draw title text
  textSize(128); //set the size for the game title to large
  fill(255, 0, 0); //red
  text("Cat Petter 2000", width/2, 150); //title near the top
  
 //draw button and add functions to it, so when mousePressed set startScreen to false
 rectMode(CORNERS); //set rectMode style to corners
 
 fill(0); //draw with black
 rect(330, 420, 570, 510); // button background
 fill(255, 0, 0); //red
 textSize(80); //medium text size
 text("Start", width/2, 460); //button text
 
 if (mouseX >= 330 && mouseX <= 570 && mouseY >= 420 && mouseY <= 510) { //if mouse is over the button, highlight it
   fill(255, 100, 0, 20); // very translucent orange
   rect(330, 420, 570, 510); // rectangle that highlights the button shape
   
   if (mousePressed) { //if mouse is pressed, turn off the start screen (which then starts the game)
     currentState = GameState.GAMEPLAY;
   }
 }
}

void gamePlaying() {
  //call draw background 
  Background1.drawBackground("game");
  
  rectMode(CENTER); //change to center draw mode because it is easier for when I need to make it follow mouse
 // draw the brushes
   //rubber brush
   fill(95, 180, 156); //cyan
   ellipse(450, 520, 80, 40); //main round part of handle
   rect(450, 530, 80, 20); // rectangle part of handle
   ellipse(415, 540, 10, 10); //far left bump
   ellipse(432.5, 540, 10, 10); //left bump
   ellipse(450, 540, 10, 10); //middle brush bump
   ellipse(467.5, 540, 10, 10);//right bump
   ellipse(485, 540, 10, 10);// far right bump
   
   //wooden brush
   fill(211, 150, 119); //tan wood colour
   rect(675, 525, 80, 30); //main head of brush
   ellipse(715, 525, 80, 15); //handle of brush
   rect(640, 540, 10, 20); //far left bump
   rect(662, 540, 10, 20); //left bump
   rect(688, 540, 10, 20); //right bump
   rect(710, 540, 10, 20); //far right bump
   
   //wire brush
   fill(160, 162, 172); //silver]
   rect(225, 520, 80, 20); //main head of brush
   rect(280, 520, 60, 10); //handle of brush
   stroke(2); //for drawing the wire tips
   line(185, 530, 185, 540); //wire 1
   line(195, 530, 195, 540); //wire 2
   line(205, 530, 205, 540); //wire 3
   line(215, 530, 215, 540); //wire 4
   line(225, 530, 225, 540); //wire 5
   line(235, 530, 235, 540); //wire 6
   line(245, 530, 245, 540); //wire 7
   line(255, 530, 255, 540); //wire 8
   line(265, 530, 265, 540); //wire 9
 
 noStroke(); //reset back to nostroke
 rectMode(CORNERS); //reset back to resctMode
 //draw the strike symbols
 fill(255, 0, 0); // red
 quad(15, 20, 20, 15, 55, 50, 50, 55); //strike 1 \
 quad(50, 15, 55, 20, 20, 55, 15, 50); // strike 1 /
 fill(255, 0, 0); // red
 quad(75, 20, 80, 15, 115, 50, 110, 55); //strike 2 \
 quad(110, 15, 115, 20, 80, 55, 75, 50); // strike 3 /
 fill(255); // white
 quad(135, 20, 140, 15, 175, 50, 170, 55); //strike 3 \
 quad(170, 15, 175, 20, 140, 55, 135, 50); // strike 3 /
 
 distance = mouseX;
 //draw differnet cat faces
 if (distance >= 0 && distance <= 20) {
     CatFace1.DrawCatFace("happy");
 }
 else if (distance >= 20 && distance <= 50) {
   CatFace1.DrawCatFace("smile");
 }
 else if (distance >= 50 && distance <= 100) {
   CatFace1.DrawCatFace("neutral");
 }
 else {
   CatFace1.DrawCatFace("mad");
   //add a Strike
 }
 
}

void gameOverOn() {
  //call draw background but cat bite
  Background1.drawBackground("end");
  CatFace1.DrawCatFace("angry");
  
  //draw game over text
  
  //draw reset button, when mousePressed set startScreen to true
 rectMode(CORNERS); //set rectMode style to corners
 
 fill(0); //draw with black
 rect(330, 420, 570, 510); // button background
 fill(255, 0, 0); //red
 textSize(80); //medium text size
 text("Restart", width/2, 460); //button text
 
 if (mouseX >= 330 && mouseX <= 570 && mouseY >= 420 && mouseY <= 510) { //if mouse is over the button, highlight it
   fill(255, 100, 0, 20); // very translucent orange
   rect(330, 420, 570, 510); // rectangle that highlights the button shape
   
   if (mousePressed) { //if mouse is pressed, turn off the start screen (which then starts the game)
     currentState = GameState.START;
   }
}
}
