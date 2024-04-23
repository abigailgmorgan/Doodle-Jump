class Player{
//delcare starting vars
  int playerX;
  int playerY;
  int playerD;
  
  color playerC;
  
  int xSpeed;
  int ySpeed;
  
  boolean movingLeft;
  boolean movingRight;
  
  boolean isJumping;
  boolean isFalling;
  
  int jumpHeight;
  int highestY;
  
  int left;
  int right;
  int top;
  int bottom;

//constructor
     Player(){
        //initialize vars
           playerD = 50;
           playerX = width/2;
           playerY = height-playerD/2;
          
           playerC = color(255);
           
           xSpeed = 0;
           ySpeed = 3;
           
           movingLeft = false;
           movingRight = false; 
           
           isJumping = true;
           isFalling = false;
           
           jumpHeight = 100;
           highestY = playerY - jumpHeight;
           
           left = playerX - playerD/2;
           right = playerX + playerD/2;
           top = playerY - playerD/2;
           bottom = playerY + playerD/2;
     }
 
     
     
//FUNCTIONS     
   //function to draw the player 
       void render(){
        fill(playerC);
        circle(playerX, playerY, playerD);
         }
    
  //moving player function      
     void move(){
       //playerY -= ySpeed;
        if (movingLeft == true){
          playerX -= 5;
        }
        if (movingRight == true){
          playerX += 5;
        }
        
       left = playerX - playerD/2;
       right = playerX + playerD/2;
       top = playerY - playerD/2;
       bottom = playerY + playerD/2;
       
        if (playerX-playerD/2<0){
          playerX = playerD/2;
        }
        if (playerX+playerD/2>width){
          playerX = width-playerD/2;
        } 
     }
      
    //function to jump 
        void jumping(){
          if (isJumping == true){
            playerY -= ySpeed;
      }
    }
    
    //function to fall
        void falling(){
          if (isFalling == true){
            playerY += ySpeed;
          }
        }
    
    //function for top of each jump
        void topOfJump(){
          if(playerY<=highestY){
            isJumping = false;
            isFalling = true; // start falling
          }
        }
      
    //function to land
        void land(){
          if(playerY>= height-playerD/2){
            isFalling = false;
            playerY = height-playerD/2;
            isJumping = true;
          }
        }
      
    //function to fall of platform
        void fallOffPlatform(ArrayList<Platform> aPlatformList){
          if(isJumping == false && playerY<height- playerD/2){
            boolean onPlatform = false;
       
            for (Platform aPlatform :aPlatformList){
              if(top <= aPlatform.platformB &&
                 bottom >= aPlatform.platformT &&
                 left <= aPlatform.platformR &&
                 right <= aPlatform.platformL){
                   onPlatform = true;
                 }
              }
               if (onPlatform == false){
                isFalling = true; 
                if (playerY+playerD>height){
                  state +=1;
                  }
                  }
                  }
                  } 
}
