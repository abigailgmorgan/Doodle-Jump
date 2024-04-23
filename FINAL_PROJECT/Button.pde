class Button{
/////////////////DATA
  int bX;
  int bY;
  int bW;
  int bH;
  
  color bC;
  
  boolean buttonPressed = false;
  boolean inButton;
  
  
  
////////////////////CONSTRUCTOR
  Button(int startingBX, int startingBY, int startingBW, int startingBH, int startingBC){
    bX = startingBX;
    bY = startingBY; 
    bW = startingBW;
    bH = startingBH;
    bC = startingBC;
  }
  
////////////////// FUNCTIONS

  
  // render
  
  void render(){
    rectMode(CENTER);
    stroke(255);
    fill(bC);
    rect(bX, bY, bW, bH);
    //println(buttonPressed(bX,bY,bSize));
  }
    
//button function

//helper function
boolean isBetween(int num, int min, int max){
  if(num>min&&num<max){
    return true;
  } else{
    return false;
  }
}

//button pressed function 
boolean buttonPressed(){
  int left = bX - bW/2;
  int right = bX + bW/2;
  int top = bY - bH/2;
  int bottom = bY + bH/2;
  
  if (isBetween(mouseX, left, right) &&
      isBetween(mouseY, top, bottom) && 
      mousePressed == true){
        return true;
      }
  else {
    return false; 
  }
  
}
 
void b2Text(){
  fill(255);
  text("click to start", 175, 215);
}

void b1Text(){
  fill(0);
  text("Instructions", 175, 115);
  
}


 void b3Text(){
  fill(0);
  textSize(60);
  text("Home Screen", 130, 265);
  
}

 void b4Text(){
  fill(0);
  textSize(60);
  text("Reset Game", 150, 415);
  
}
 
 
 
 
 
 
}


  
