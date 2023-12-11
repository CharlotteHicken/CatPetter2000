public class Favourite {
  
  int x;
  int y;
  String brush;
  
   Favourite(int randomX, int randomY, String randomBrush) { 
    randomX = (int) (random(260, 690)); //pick a random x value that will be on the cat and round it to be an integar
    x = randomX; //set the random x value to the global x
    randomY = (int) (random(180, 420)); //pick a random y value that will be on the cat and round it to an integar
    y = randomY; //set the random y calue to the gloabl y
    
    String[] options = { "hand", "wire", "rubber", "wooden"}; //make a string with the brush options
    
    int select = (int) (random(options.length)); //pick a random number that will be a brush
    randomBrush = options[select]; //set the randomBrush to be 
    brush = randomBrush;
  }
  
  int getX(){ //when this is called, return the value of x
    return x;
  }
  
  int getY(){ //when this is called, return the value of y
    return y;
  }
  
  String getBrush(){ //when this is called, return the brush string 
    return brush;
  }
  
  
  
  
}
