import processing.sound.*;

SoundFile jumpSound;
SoundFile shotSound;
SoundFile backgroundSound;

//declaring vars 

// image
PImage backImg;
PImage ship;
PImage moon;
PImage planet;
PImage lose;
PImage villan;
PImage gameBackground;
PImage[] monsterBlue = new PImage[2];


//little jumping guy
PImage guy;
PImage guyShoot;
boolean showImg = true;


//declaring timer vars
//timer vars
int startTimeE;
int currentTimeE;
int interval = 10000;

//state vars 
int state = 0; 


//animation vars
Animation monsterAnimation;


//player vars
Player player1;

//button vars
Button button1;
Button button2;
Button button3;
Button button4;

//platform vars
Platform platform1;
Platform platform2;
Platform platform3;
Platform platform4;
Platform platform5;
Platform platform6;
Platform platform7;
Platform platform8;
Platform platform9;

//enemy vars
//Enemy enemy1;
//Enemy enemy2;

//arraylist
ArrayList<Platform> platformList;
ArrayList<Bullet> bulletList;
ArrayList <Enemy> enemyList;


Score score;



void setup(){
  //canvas size
  size(600,800);
  
  //initializing vars
  
  //image set up   
   ship = loadImage("ship.png");
   moon = loadImage("moon.png");
   lose = loadImage("lose.jpg");
   planet = loadImage("planet.png");
   villan = loadImage("enemy.png");
   imageMode(CENTER);
  //initialize my array 
   for (int index=0; index<monsterBlue.length; index++){
     monsterBlue[index] = loadImage("monsterblue" + index + ".png" );
   }
   //initials animation vars
   monsterAnimation = new Animation(monsterBlue, .05, 1.5);
    
    
    backImg = loadImage("space.jpg");
    imageMode(CENTER);
    backImg.resize(400,300);
    
    gameBackground = loadImage("gameBackground.jpg");
    imageMode(CENTER);

  //initialize animation
  guy = loadImage("characterA.png");
  imageMode(CENTER);
  guy.resize(100,100);
  
  guyShoot = loadImage("characterB.png");
  imageMode(CENTER);
  guyShoot.resize(100,100);
  
  //initialize timer vars
  startTimeE = millis();
  
  
  shotSound = new SoundFile(this, "shot.mp3");
  backgroundSound = new SoundFile(this, "back.mp3");
  jumpSound = new SoundFile(this, "spring.wav");
  
  
  //initinalize player vars
  player1 = new Player();
  
  //initinalize platform vars
  platform1 = new Platform(500,700);
  platform2 = new Platform(400,600);
  platform3 = new Platform(300,500);
  platform4 = new Platform(100,550);
  platform5 = new Platform(200, 750);
  platform6 = new Platform(50, 100);
  platform7 = new Platform(375, 400);
  platform8 = new Platform(550, 300);
  platform9 = new Platform(200, 300);
  
  
  score = new Score();
  
  
  //initinalize enemy vars
  //enemy1 = new Enemy(300,50,25,75);
  //enemy2 = new Enemy(500,100,50,100);
  
  //initinalize lists vars
  platformList = new ArrayList<Platform>();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  
  platformList.add(platform1);
  platformList.add(platform2);
  platformList.add(platform3);
  platformList.add(platform4);
  platformList.add(platform5);
  platformList.add(platform6);
  platformList.add(platform7);
  platformList.add(platform8);
  platformList.add(platform9);
  //enemyList.add(enemy1);
  //enemyList.add(enemy2);
  enemyList.add(new Enemy(100, 100, 50, 75));
  
  
  //initialize button vars
  button1 = new Button(width/2,100,300,50, color(255,255,0));
  button2 = new Button(width/2,200,300, 50, color(#75B2ED));
  button3 = new Button(width/2,250,400, 100, color(#75B2ED));
  button4 = new Button(width/2,400,400, 100, color(#75B2ED));


  
}

void draw(){
  background(42);
  rectMode(CENTER);
  

  
  




  
  //swicth states
  switch(state){
    case 0:
    startScreen();
    break;
    case 1:
    gameScreen();
    score.runTimer();
    break;
    case 2: 
    loseScreen();


    break;
    default:
    background(255,0,255);
    break;
    
  }
  
  
  
  
  
  

  
  


   
}


//key pressed functions 
void keyPressed(){

//make player move right and left  
  if (key == CODED){
    if (keyCode == LEFT){
      player1.movingLeft = true;
    }
  }
   if (key == CODED){
    if (keyCode == RIGHT){
      player1.movingRight = true;
    }
  }
  
//make bullets shoot   
  if(key == ' '){
    bulletList.add(new Bullet(player1.playerX, player1.playerY));
    shotSound.play();
    showImg = false;

  } 
  
///////////////////////////////////////////////////STATESWITCH CHNAGE THIS  
  if (key == 's'){
    state = 1 ;
    score.startTime = millis();

  }
  if (key == 'r'){
    state = 0;
  }
  
  
}


void keyReleased(){
  
//key released right and left movement 
    if (key == CODED){
    if (keyCode == LEFT){
      player1.movingLeft = false;
    }
  }
   if (key == CODED){
    if (keyCode == RIGHT){
      player1.movingRight = false;
    }
  }
  
    
//make bullets shoot   
  if(key == ' '){
    showImg = true;
  } 
  
}

//void resetGame(){
  
//}


void gameScreen(){
  //SOUND
  //Aestetic part of screen
  image(gameBackground, 300,150);
  image(gameBackground, 300,525);
  image(gameBackground, 300,800);
    //image setting
  if (showImg == true){
    image(guy, player1.playerX, player1.playerY);
  }
  
  if (showImg == false){
    image(guyShoot, player1.playerX, player1.playerY);
  }
  
     //play sound of loop
  if(backgroundSound.isPlaying() == false){
    backgroundSound.play();
    backgroundSound.rate(2);   // makes it go two times faster
   
  }
  

  
  
  
  
      //ENEMY TIMER VARS
    currentTimeE = millis();
    if (currentTimeE - startTimeE > interval){
      println("timer triggered");
      
      enemyList.add(new Enemy(300, 100, 75, 60));
  
   
    //reset the timer
    startTimeE = millis();
  }
  
     //PLAYERS
        //player1.render();
        player1.move();
        player1.jumping();
        player1.falling();
        player1.topOfJump(); 
        player1.land();
        player1.fallOffPlatform(platformList);
      
      //BULLET
        //for loop for bullets
        for (Bullet aBullet : bulletList){
          aBullet.render();
          aBullet.move();
          aBullet.checkRemove();
            for(Enemy anEnemy :enemyList){
              aBullet.shootEnemy(anEnemy);
            }
        }
        //unwanted bullets
        for (int i = bulletList.size()-1; i >= 0; i= i-1){ 
          Bullet aBullet = bulletList.get(i);
          if(aBullet.remove == true){
            bulletList.remove(aBullet);
          }
        }
        
        
      //PLATFORMS
        //for loop for platforms
        for(Platform aPlatform : platformList){
          aPlatform.render();
          aPlatform.collide(player1);
          aPlatform.move();
        }
          
      //ENEMY
      

      
          for (Enemy anEnemy : enemyList){
            anEnemy.render();
            anEnemy.move();
            anEnemy.killPlayer(player1);
          }
        //unwanted enemys or kill enemies
        for (int i = enemyList.size()-1; i >= 0; i= i-1){ 
          Enemy anEnemy = enemyList.get(i);
          if(anEnemy.remove == true){
            enemyList.remove(anEnemy);
          }
        }
        

}


void startScreen(){
    background(30);
    image(backImg, 200, 150);
    image(backImg, 600, 150);
    image(backImg, 200, 450);
    image(backImg, 600, 450);
    image(backImg, 200, 650);
    image(backImg, 600, 650);
    
    monsterAnimation.display(300,600);
    image(ship, 100, 500);
    moon.resize(200,200);
    image(moon, 500, 200);
    planet.resize(200,200);
    image(planet, 500, 700);


    textSize(48);
    //text("Press 's' to start", width/4, height/2);
    button1.render();
    button1.b1Text();
    button2.render();
    button2.b2Text();
    if (button2.buttonPressed() == true){
      //println("button pressed two");
      state = 1;
      
    }
    if (button1.buttonPressed() == true){
      //println("button pressed one");
    image(backImg, 200, 150);
    image(backImg, 600, 150);
    image(backImg, 200, 450);
    image(backImg, 600, 450);
    image(backImg, 200, 650);
    image(backImg, 600, 650);

      button1.render();
      button1.b1Text();
      fill(color(45,100,200));
      rect(width/2, 500, 300,500);
      fill(255);
      textSize(25);
      text("To play you will move the ", 160, 300);
      text("arrow keys left and right to", 160, 350);
      text("move the character side to", 160, 400);
      text("side. Press the space bar to", 160, 450);
      text("shoot and kill the enemies.", 160, 500);
      text("The goal is to get a high", 160, 550);
      text("score.", 160, 600);
      

      //Press the space bar to 
      //The goal is to get a high score.
      
    }

}
  
void loseScreen(){
  if (backgroundSound.isPlaying() == true){
    backgroundSound.stop();
  }

    background(42);
    lose.resize(600,400);
    image(lose, 300,200);
    image(lose, 300,600);
    textSize(25);
    //text("Lose press r to restart", width/4, height/2);
    textSize(40);
    fill(255);
   score.highScore();
          
score.stopTimer();
     //int elapsedTime = millis() - score.startTime;
    //text(elapsedTime, 300, 200);
    
    button3.render();
    button3.b3Text();
    button4.render();
    button4.b4Text();
    if (button3.buttonPressed() == true){
         state = 0;
         println("button pressed three");
         reset();
   
    }
   if (button4.buttonPressed() == true){
   println("button pressed four");
   state = 1;
   reset(); 
    }
    
    
}




void reset(){
   //initinalize player vars
  player1 = new Player();
  
  //initinalize platform vars
  platform1 = new Platform(500,700);
  platform2 = new Platform(400,600);
  platform3 = new Platform(300,500);
  platform4 = new Platform(100,550);
  platform5 = new Platform(200, 750);
  platform6 = new Platform(50, 100);
  platform7 = new Platform(375, 400);
  platform8 = new Platform(550, 300);
  platform9 = new Platform(200, 300);
  
  
  score = new Score();
  
 
  
  //initinalize lists vars
  platformList = new ArrayList<Platform>();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  
  platformList.add(platform1);
  platformList.add(platform2);
  platformList.add(platform3);
  platformList.add(platform4);
  platformList.add(platform5);
  platformList.add(platform6);
  platformList.add(platform7);
  platformList.add(platform8);
  platformList.add(platform9);
  //enemyList.add(enemy1);
  //enemyList.add(enemy2);
  
  
  //initialize button vars
  button1 = new Button(width/2,100,300,50, color(255,255,0));
  button2 = new Button(width/2,200,300,50, color(#75B2ED));
}
