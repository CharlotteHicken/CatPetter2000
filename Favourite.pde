public class Favourite {
  
  int x;
  int y;
  String brush;
  
   Favourite() { 
    x = (int) (random(260, 690)); //pick a random x value that will be on the cat and round it to be an integar
    y = (int) (random(180, 420)); //pick a random y value that will be on the cat and round it to an integar
    
    String[] options = { "hand", "wire", "rubber", "wooden"}; //make a string with the brush options
    
    int select = (int) (random(options.length)); //pick a random number that will be a brush
    brush = options[select]; //set the brush to be one of the options based on the random number
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
