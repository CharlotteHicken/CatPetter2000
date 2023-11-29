public class Fur{
  
  PVector location;
  PVector velocity;
  int cursorX;
  int cursorY;
  
  Fur() {
   location = new PVector(random(mouseX -10, mouseX +10),  random(mouseY -5, mouseY +5)); //pick a random location near the mouse cursor
   velocity = new PVector(random(-1,1), random(2, 4)); //pick a random velocity that moves left or right, and moves down at a different speed
  }
  
  void display() {
   cursorX = mouseX;
   cursorY = mouseY;
   stroke(255);
   strokeWeight(2);
   line(location.x, location.y, location.x + 6, location.y + 2);
   noStroke();
  }
  
  void move() {
    location.add(velocity); //move the fur down
    
    if (location.x >= 238 && location.x <= 522 && location.y >= 300 && location.y <= 355) { //if particles go in the cup reset positions
     location.x = random(mouseX - 75, mouseX); 
     location.y = random(mouseY - 10, mouseY + 10); 
    }
    else if(location.y > 600) { //if lower than the screen, reset positions
     location.x = random(mouseX - 75, mouseX); 
     location.y = random(mouseY - 10, mouseY + 10); 
    }
  }
  
}
