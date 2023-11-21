public class Background {
 
  void drawBackground(String bgMode) {
    //draw the background, eventually it will have a randomized pattern
    background(69, 105, 144); //pretty blue background
   
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
       text("Game Over", 130, 155); //title near the top
       textSize(128); //set the size for the game title to large
       fill(255, 0, 0); //red
       text("Game Over", 145, 155); //title near the top
   }
   
  }
  
  
}
