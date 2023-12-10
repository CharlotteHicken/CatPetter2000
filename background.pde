public class Background {
  
  int numVectors = 50;
  PVector[] vectors;
  
  void initializeBackgroundVectors(){
    vectors = generateRandomVectors(); //generates all the random positions in one go!
  }
 
  void drawBackground(String bgMode) {
    //draw the background, eventually it will have a randomized pattern
    background(69, 105, 144); //pretty blue background
    
    drawBluePattern(vectors); //draw the random background lines
   
   //draw floor
   fill(100, 66, 40); //medium brown
   rect(0, 360, 900, 600); //floor shape
   
   //draw cat body
   fill(251, 247, 244); //creme
   rect(270, 180, 690, 420); //main body shape
   ellipse(690, 300, 100, 240); //right body round
   ellipse(270, 300, 60, 240); //left body round
   fill(161, 104, 58); //copper colour
   ellipse(450, 280, 80, 110); //spot 1
   ellipse(610, 250, 80, 50); //spot 2
   ellipse(360, 210, 50, 30); //spot 3
   fill(38, 28, 21); //dark brown
   ellipse(500, 330, 100, 120); //spot 4
   ellipse(690, 200, 50, 40); //spot 5
   
   //cat legs
   fill(251, 247, 244); //creme
   rect(120, 350, 270, 370); //further away front paw
   ellipse(120, 360, 20, 20); //far paw round
   rect(110, 400, 270, 420); //closer front paw
   ellipse(110, 410, 20, 20); //close paw round
   fill(241, 237, 234); //darker creme
   rect(510, 400, 690, 430); //hind leg
   ellipse(510, 415, 30, 30); //hind leg round, left
   ellipse(690, 415, 30, 30); //hind leg round, right
   
   //cat head (without the expressions)
   fill(38, 28, 21); //dark brown
   triangle(200, 60, 250, 95, 190, 150); //left ear
   triangle(340, 60, 290, 95, 350, 150); //right ear
   fill(238, 210, 204); //pale pink
   triangle(205, 70, 245, 95, 195, 150); //left inner ear
   triangle(335, 70, 295, 95, 345, 150); //right inner ear
   fill(251, 247, 244); //creme
   ellipse(270, 180, 180, 180); //main face shape
   fill(38, 28, 21); //dark brown
   arc(270, 180, 180, 180, PI - 0.25, 2*PI + 0.25); // top half of cat head
   fill(161, 104, 58); //copper colour
   arc(270, 180, 130, 170, PI - 0.20, 2*PI + 0.20); //coloured part of cat head
   fill(251, 247, 244); //creme
   triangle(270, 100, 230, 190, 310, 190); //white stipe on cat's face
   fill(238, 210, 204); //pale pink
   triangle(270, 205, 280, 195, 260, 195); //nose
   
   
   if (bgMode == "end"){
     fill(0, 50); //very transparent black
     rect(0,0, 900, 600);
     
       //draw game over text
       textSize(135); //set the size for the game title to large
       fill(0); //black
       text("Game Over", width/2, 100); //title near the top
       textSize(128); //set the size for the game title to large
       fill(255, 0, 0); //red
       text("Game Over", width/2, 100); //title near the top
   }
   
   if (bgMode == "win"){
     fill(0, 50); //very transparent black
     rect(0,0, 900, 600);
     
       //draw game over text
       textSize(100); //set the size for the game title to large
       fill(0); //black
       text("You Pet Cats Good!", width/2, 100); //title near the top
       textSize(95); //set the size for the game title to large
       fill(255, 0, 0); //red
       text("You Pet Cats  Good!", width/2, 100); //title near the top
   }
   
  }
  
  public void drawBluePattern(PVector[] vectors) {
    // Set the stroke color to blue
    stroke(92, 123, 157); // light blue
    strokeWeight(25); //wide line!

    for (int i = 0; i < numVectors; i++) { //works through the numVectors
      PVector start = vectors[i * 2]; //finds the start point from the vectors array
      PVector end = vectors[i * 2 + 1]; //find the end point from the vectors array

      line(start.x, start.y, end.x, end.y); //draw the line with these values!
    }
    
    noStroke(); //reset to noStroke!
  }

  public PVector[] generateRandomVectors() {
    PVector[] vectors = new PVector[numVectors * 2]; //creates an array for the points to the background. Needs to multiply the number of vectors by 2, one for the start point, and one for the end

    for (int i = 0; i < numVectors; i++) { //go through the array the amount of numVectors there are. for the first vector, generate it's random position and then calculate direction/distance stuff.
      for (int j = 0; j < 2; j++) { //do this twice, one for end point and one for the second.
            float x = random(900); //random x within the width
            float y = random(600); //random y within the height
            vectors[i * 2 + j] = new PVector(x, y); //creates a pVector object based on these given points
      }
      
      PVector direction = PVector.sub(vectors[i * 2 + 1], vectors[i * 2]); //calculates the direction between 2 points.
      float distance = direction.mag(); //calculates the distance between 2 points

        // display the direction and distance (only used to show the skill)
        //println("Direction: " + direction + ", Distance: " + distance);
      
    }

    return vectors; //return the values to be used later
    
  }
  
  
}
