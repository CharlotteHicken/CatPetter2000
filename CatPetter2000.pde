/* Cat Petter 2000 created by Charlotte Hicken 



*/

PImage flameImg;
Background Background1;
CatFace CatFace1;
Favourite Favs;
int favX;
int favY;
String favBrush;
ArrayList<Fur> furs;
boolean startScreen;
boolean gameOver;
int distance;
String currentBrush;
int strike;
enum GameState {START, GAMEOVER, GAMEPLAY, WIN};
GameState currentState = GameState.START;


void setup() {
  size(900, 600); //set canvas size to a landscape rectangle
  
  noStroke(); //no outline on shapes
  textAlign(CENTER, CENTER);
  
  frameRate(30); //frame rate at 3
  
  Background1 = new Background();
  Background1.initializeBackgroundVectors();
  flameImg = loadImage("Flame.jpg");
  
  CatFace1 = new CatFace();
  furs = new ArrayList<Fur>();
  
  Favs = new Favourite(favX, favY, favBrush);
  
  currentBrush = "hand";
 
  startScreen = false;
  gameOver = true;
  
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
     case WIN:
       gameWin();
       break;
  }
  
  //testing feature that will be commented out at the end
  if (mousePressed) { //if mouse is pressed, print the coordinates of where it was pressed
   println(mouseX + ", " + mouseY); 
  }
  
  //testing feature that gives me the randomized values.
  if (keyPressed) {
   println(Favs.getX() + ", " + Favs.getY() + ", " + Favs.getBrush());  
  }
  
}

void startScreenOn() {
  //reset all the values to the default
  gameOver = false;
  Favs = new Favourite(favX, favY, favBrush);
  strike = 0;
  frameRate(30);
  currentBrush = "hand";
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
  
  //draw instructions text
  fill(255); //white
  textSize(20); //small text
  text("This cat is very particular about being pet.", 700, 25); //line 1 of text
  text("Pay attention to it to find it's favourite spot", 705, 50); //line 2 of text
  text("and if it likes brushes!", 615, 75); //line 3 of text
  
  rectMode(CENTER); //change to center draw mode because it is easier for when I need to make it follow mouse
 // draw the brushes
 
   if ( currentBrush != "rubber") {
     //rubber brush
     fill(95, 180, 156); //cyan
     ellipse(450, 520, 80, 40); //main round part of handle
     rect(450, 530, 80, 20); // rectangle part of handle
     ellipse(415, 540, 10, 10); //far left bump
     ellipse(432.5, 540, 10, 10); //left bump
     ellipse(450, 540, 10, 10); //middle brush bump
     ellipse(467.5, 540, 10, 10);//right bump
     ellipse(485, 540, 10, 10);// far right bump
   }
   
   if (currentBrush != "wooden") {
     //wooden brush
     fill(211, 150, 119); //tan wood colour
     rect(675, 525, 80, 30); //main head of brush
     ellipse(715, 525, 80, 15); //handle of brush
     rect(640, 540, 10, 20); //far left bump
     rect(662, 540, 10, 20); //left bump
     rect(688, 540, 10, 20); //right bump
     rect(710, 540, 10, 20); //far right bump
   }
   
   if (currentBrush != "wire"){
     //wire brush
     fill(160, 162, 172); //silver]
     rect(225, 520, 80, 20); //main head of brush
     rect(280, 520, 60, 10); //handle of brush
     stroke(2);
     strokeWeight(2); //for drawing the wire tips
     line(185, 530, 185, 540); //wire 1
     line(195, 530, 195, 540); //wire 2
     line(205, 530, 205, 540); //wire 3
     line(215, 530, 215, 540); //wire 4
     line(225, 530, 225, 540); //wire 5
     line(235, 530, 235, 540); //wire 6
     line(245, 530, 245, 540); //wire 7
     line(255, 530, 255, 540); //wire 8
     line(265, 530, 265, 540); //wire 9
   }
 
 noStroke(); //reset back to nostroke
 rectMode(CORNERS); //reset back to rectMode
 //draw the strike symbols
 fill(255); // white default
 if (strike >= 1) { //if there is at least 1 strike, draw the X red
   fill(255, 0, 0); // red
 }
 quad(15, 20, 20, 15, 55, 50, 50, 55); //strike 1 \
 quad(50, 15, 55, 20, 20, 55, 15, 50); // strike 1 /
 fill(255); // white default
 if (strike >= 2) { //if there are at least 2 strikes, draw the X red
   fill(255, 0, 0); // red
 }
 quad(75, 20, 80, 15, 115, 50, 110, 55); //strike 2 \
 quad(110, 15, 115, 20, 80, 55, 75, 50); // strike 3 /
 fill(255); // white default
 if (strike == 3) { //if there are 3 strikes, draw the X red
   fill(255, 0, 0); // red
 }
 quad(135, 20, 140, 15, 175, 50, 170, 55); //strike 3 \
 quad(170, 15, 175, 20, 140, 55, 135, 50); // strike 3 /
 
 distance = (int) dist(Favs.getX(), Favs.getY(), mouseX, mouseY); //get the distance between the favourite point and the mouse
 //draw differnet cat faces based on the current brush and the distance between mouse and fav spot
 if (distance >= 0 && distance <= 20 && Favs.getBrush() == currentBrush) { //if the close to the fav spot, and have the fav brush
     CatFace1.DrawCatFace("happy");
 }
 else if (distance >= 20 && distance <= 50 && Favs.getBrush() == currentBrush) { //if near the fav spot and fav brush
   CatFace1.DrawCatFace("smile");
 }
 else if (distance >= 50 && distance <= 100) { //if near fav spot (brush does not matter)
   CatFace1.DrawCatFace("neutral");
 }
 else {
   CatFace1.DrawCatFace("mad");
 }
 
    for(int i = furs.size() - 1; i >= 0; i--) { //work through the arrayList backwards, because backwards can have less errors
      furs.get(i).move(); // move the fur particles
      furs.get(i).display(); //draw the particles
      if (furs.get(i).position.y > 600) { //if below the screen
       furs.remove(i);  //remove the object
      }
    }
    
 if (strike == 3) {
   currentState = GameState.GAMEOVER;
 }
      
      
 if (mouseX >= 230 && mouseX <= 700 && mouseY >= 160 && mouseY <= 450) {
   furs.add(new Fur(mouseX, mouseY)); //when the mouse is pressed, create more fur particles
 }
 
 
 //draw the burshes following the mouse position if they are selected
 rectMode(CENTER); //change to center draw mode because it is easier for when I need to make it follow mouse
 if (currentBrush == "rubber") {
     //rubber brush (X = 450, Y = 520)
     noCursor();
     fill(95, 180, 156); //cyan
     ellipse(mouseX, mouseY, 80, 40); //main round part of handle
     rect(mouseX, mouseY + 10, 80, 20); // rectangle part of handle
     ellipse(mouseX - 35, mouseY +20, 10, 10); //far left bump
     ellipse(mouseX - 17.5, mouseY + 20, 10, 10); //left bump
     ellipse(mouseX, mouseY +20, 10, 10); //middle brush bump
     ellipse(mouseX + 17.5, mouseY + 20, 10, 10);//right bump
     ellipse(mouseX + 35, mouseY + 20, 10, 10);// far right bump
   }
   
   if (currentBrush == "wooden") {
     //wooden brush (X = 700, Y = 525)
     noCursor();
     fill(211, 150, 119); //tan wood colour
     rect(mouseX - 25, mouseY, 80, 30); //main head of brush
     ellipse(mouseX + 15, mouseY, 80, 15); //handle of brush
     rect(mouseX - 60, mouseY + 15, 10, 20); //far left bump
     rect(mouseX - 38, mouseY + 15, 10, 20); //left bump
     rect(mouseX - 12, mouseY + 15, 10, 20); //right bump
     rect(mouseX + 10, mouseY + 15, 10, 20); //far right bump
   }
   
   if (currentBrush == "wire"){
     //wire brush (X = 250, Y = 520);
     noCursor();
     fill(160, 162, 172); //silver
     rect(mouseX - 25, mouseY, 80, 20); //main head of brush
     rect(mouseX + 30, mouseY, 60, 10); //handle of brush
     stroke(2);
     strokeWeight(2); //for drawing the wire tips
     line(mouseX - 65, mouseY + 10, mouseX - 65, mouseY + 20); //wire 1
     line(mouseX - 55, mouseY + 10, mouseX - 55, mouseY + 20); //wire 2
     line(mouseX - 45, mouseY + 10, mouseX - 45, mouseY + 20); //wire 3
     line(mouseX - 35, mouseY + 10, mouseX - 35, mouseY + 20); //wire 4
     line(mouseX - 25, mouseY + 10, mouseX - 25, mouseY + 20); //wire 5
     line(mouseX - 15, mouseY + 10, mouseX - 15, mouseY + 20); //wire 6
     line(mouseX - 5, mouseY + 10, mouseX - 5, mouseY + 20); //wire 7
     line(mouseX + 5, mouseY + 10, mouseX + 5, mouseY + 20); //wire 8
     line(mouseX + 15, mouseY + 10, mouseX + 15, mouseY + 20); //wire 9
   }
   noStroke(); //reset back to nostroke
   rectMode(CORNERS); //reset back to rectMode
   
   if (currentBrush == "hand") { //turn the cursor back on if the hand is selected
     cursor();
   }
 
}

void gameOverOn() {
  //call draw background but cat bite
  Background1.drawBackground("end");
  CatFace1.DrawCatFace("angry");
  cursor();
  
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
}
}

void gameWin() {
  //call draw background but cat happy
  Background1.drawBackground("win");
  CatFace1.DrawCatFace("happy");
  cursor();
  
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
}
}

void mousePressed(){
  if (currentState == GameState.GAMEPLAY) {
    if (distance >= 0 && distance <= 20 && Favs.getBrush() == currentBrush) {
      currentState = GameState.WIN;
    }
    else if (distance >= 20 && distance <= 50 && Favs.getBrush() == currentBrush) {
    }
    else if (distance >= 50 && distance <= 100) {
    }
    else if (mouseX >= 260 && mouseX <= 690 && mouseY >= 180 && mouseY <= 420 ){
     strike++;
    }
  }
  
}

void mouseReleased(){
    if (currentState == GameState.WIN || currentState == GameState.GAMEOVER){ //if on the game screens
      if (mouseX >= 330 && mouseX <= 570 && mouseY >= 420 && mouseY <= 510) { //if mouse is over the button
       currentState = GameState.START; //set game to title screen
      }
    }
    else if (currentState == GameState.GAMEPLAY) { //if the gameplay is currently active
      if (mouseX >= 180 && mouseX <= 315 && mouseY >= 505 && mouseY <= 545 && currentBrush != "wire") { //if click the wire brush, and the wire brush is not the current brush, the brush is now the current brush
        currentBrush = "wire";
      }
      else if (mouseX >= 180 && mouseX <= 315 && mouseY >= 505 && mouseY <= 545 && currentBrush == "wire"){ //if click the wire brush spot, and wire brush is the current bursh, the brush is set to the hand
        currentBrush = "hand";
      }
      else if (mouseX >= 405 && mouseX <= 495 && mouseY >= 500 && mouseY <= 545 && currentBrush != "rubber"){//if click the rubber brush, and the rubber brush is not the current brush, the brush is now the current brush
        currentBrush = "rubber";
      }
      else if (mouseX >= 405 && mouseX <= 495 && mouseY >= 500 && mouseY <= 545 && currentBrush == "rubber"){//if click the rubber brush spot, and rubber brush is the current bursh, the brush is set to the hand
        currentBrush = "hand";
      }
      else if (mouseX >= 630 && mouseX <= 760 && mouseY >= 505 && mouseY <= 555 && currentBrush != "wooden"){//if click the wooden brush, and the wooden brush is not the current brush, the brush is now the current brush
        currentBrush = "wooden";
      }
      else if (mouseX >= 630 && mouseX <= 760 && mouseY >= 505 && mouseY <= 555 && currentBrush == "wooden"){ //if click the wooden brush spot, and wooden brush is the current bursh, the brush is set to the hand
        currentBrush = "hand";
      }
      else if (mouseY >= 450) { //if click the bottom area of the screen, set the brush to the hand
        currentBrush = "hand";
      }
    }
  
}
