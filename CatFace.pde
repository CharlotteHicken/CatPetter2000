public class CatFace {
  
  void DrawCatFace(String face) {
    fill(18, 8, 1); //warm black
    
    if (face == "happy"){
      arc(240, 175, 20, 20, PI, 2* PI); //left eye
      arc(300, 175, 20, 20, PI, 2* PI); //right eye
      arc(270, 215, 40, 30, 0, PI); //big smile!
    }
    else if (face == "smile"){
      ellipse(240, 175, 20, 20); //left eye
      ellipse(300, 175, 20, 20); //right eye
      arc(270, 215, 40, 30, 0, PI); //smile
      fill(251, 247, 244); //creme
      ellipse(270, 215, 30, 20); //shape that makes smile from a semicircle to a curve
    }
    else if (face == "neutral"){
      ellipse(240, 175, 20, 20); //left eye
      ellipse(300, 175, 20, 20); //right eye
      rect(250, 215, 290, 220); //straight mouth shape
    }
    else if (face == "mad"){
      arc(240, 175, 20, 20, 0, PI); //left eye but mad
      arc(300, 175, 20, 20, 0, PI); //right eye but mad
      arc(270, 225, 40, 30, PI, 2 * PI); //frown
      fill(251, 247, 244); //creme
      ellipse(270, 225, 30, 20); //shape that makes smile from a semicircle to a curve
    }
    else if (face == "angry"){
      arc(240, 175, 20, 20, 0, PI); //left eye but mad
      arc(300, 175, 20, 20, 0, PI); //right eye but mad
      arc(270, 230, 40, 30, PI, 2 * PI); //frown
      fill(255); //white
      triangle(260, 225, 263, 230, 257, 230); //left tooth
      triangle(280, 225, 283, 230, 277, 230); //left tooth
    }
    
    
    
  }
  
  
  
}
