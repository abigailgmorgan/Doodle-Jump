class Platform{
  
//declare vars
    //platform 
        int platformX;
        int platformY;
        int platformW;
        int platformH;
        
        color platformC;
      
    //platform hitbox 
        int platformT;
        int platformB;
        int platformL;
        int platformR;
        
        int ySpeed;
        
        boolean movingUp;
  
// constructor
    Platform(int x, int y){
      //initialize vars 
      platformX = x;
      platformY = y;
      platformW = 65; 
      platformH = 10;
      
      platformC = color(#FCF9B8);
      
      platformT = platformY-platformH/2;
      platformB = platformY+platformH/2;
      platformL = platformX-platformW/2;
      platformR = platformX+platformW/2;
      
      ySpeed = 5;
      movingUp = true;
  }
  
//FUNCTIONS
    //function to draw platform 
          void render(){
            rectMode(CENTER);
            fill(platformC);
            rect(platformX, platformY, platformW, platformH);
            }
          
    //function ot detect colisions  
          void collide(Player aPlayer){
            if(platformL < aPlayer.right &&
                platformR > aPlayer.left &&
                platformT < aPlayer.bottom&&
                platformB > aPlayer.top){
                     aPlayer.isFalling = false;
                     aPlayer.playerY = platformY-platformH/2-aPlayer.playerD/2 - 5;
                     aPlayer.isJumping = true;
                     aPlayer.highestY = aPlayer.playerY - aPlayer.jumpHeight;
                     jumpSound.play();
                }    
                }
      
   //function moves the platform   
        void move(){
            if (movingUp == true){
              platformY += 1;
            }
            platformT = platformY-platformH/2;
            platformB = platformY+platformH/2;
            platformL = platformX-platformW/2;
            platformR = platformX+platformW/2;
           
            if (platformY > height){
              platformY = 200;
               }
               }
}
