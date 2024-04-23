class Bullet {
  
  //vars
  int x;
  int y;
  int d;
  
  int speed;
  
  boolean remove;
  
  int left;
  int right;
  int top;
  int bottom;
  

  
//constructor
  Bullet(int startingX, int startingY){
    //initialize vars
    x = startingX;
    y = startingY;
    
    d = 5;
    
    speed = 15;
    
    remove = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
    

  }
  
//function to draw bullet  
  void render(){
    circle(x,y,d);
  }
  
//function to move bullet   
  void move(){
    y -= speed; 
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }

//remove the amount of bullets stored so game doesnt lag
  void checkRemove(){
    if(y<0){
      remove = true;
    }
  }
  
  
  void shootEnemy(Enemy anEnemy){
    //if enemy is hit by a bullet remove it
    if (top<= anEnemy.bottom &&
        bottom >= anEnemy.top &&
        left <= anEnemy.right &&
        right >= anEnemy.left){
          anEnemy.remove = true;
          remove = true;
        }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
