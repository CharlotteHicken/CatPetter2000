public class Fur {
  
  PVector position;
  PVector velocity;
  float rotationAngle;
  float length;

  
  Fur(float x, float y) {
   position = new PVector(x, y); //pick a random location near the mouse cursor
   velocity = new PVector(random(-1,1), random(2, 4)); //pick a random velocity that moves left or right, and moves down at a different speed
   rotationAngle = random(-PI/4, PI/4); //pick a random angle that the fur particle will be rotated by
   length = random(10, 30); //pick a random length of the fur particle
}
  
  void display() {
   stroke(255, 240, 220); //off white particle
   strokeWeight(2); //2 pixel wide line
   
   pushMatrix(); //push the upcoming transformation so they don't effect other things
   translate(position.x, position.y); //translate the particle to the mouse
   rotate(rotationAngle); //rotate fur by an amount
   line(0, 0, length, 0); // draw the fur particle with a length
   
   popMatrix(); //restores to default transformation so it doesn't make the particles WACKY
   
   noStroke(); //set stroke to deafult so everything doesn't have a random outline
   
  }
  
  void move() {
    position.add(velocity); //move the fur down
  }
  
}
