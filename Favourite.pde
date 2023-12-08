public class Favourite {
  
  int x;
  int y;
  String brush;
  
   Favourite(int randomX, int randomY, String randomBrush) { 
    randomX = (int) (random(260, 690));
    x = randomX;
    randomY = (int) (random(180, 420));
    y = randomY;
    
    String[] options = { "hand", "wire", "rubber", "wooden"};
    
    int select = (int) (random(options.length));
    randomBrush = options[select];
    brush = randomBrush;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  String getBrush(){
    return brush;
  }
  
  
  
  
}
