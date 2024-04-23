class Enemy{
  //declare vars
    //enemy vars
      int x;
      int y;
      int w;
      int h;
      
    //hitbox vars
      int left;
      int right;
      int top;
      int bottom;
      
      boolean remove;
      
      boolean movingUp;
      
//constructor
  Enemy(int startingX, int startingY, int startingW, int startingH){
    //initialize vars
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    remove = false;
    movingUp = true;
  }
//FUNCTIONS
  //function to draw enemies  
        void render(){
          rectMode(CENTER);
          image(villan, x, y);
        }
    
  //function to move
    void move(){
      if (movingUp == true){
        y += 1;
      }
      
  //hitbox
      left = x - w/2;
      right = x + w/2;
      top = y - h/2;
      bottom = y + h/2;
    }
    
    
    
  //function to kill players
     void killPlayer(Player aPlayer){
      //if enemy is hit by a bullet remove it
          if (top <= aPlayer.bottom &&
              bottom >= aPlayer.top &&
              left <= aPlayer.right &&
              right >= aPlayer.left){
                println("player dead");
                state +=1;
              }
              }
 
  }
