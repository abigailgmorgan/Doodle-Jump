class Score{
  
//declare vars
  //timer vars
    int startTime;
    int currentTime;
    boolean playerIsAlive;
    int highscore;
  
//constructor
  Score(){
  startTime = millis();
  playerIsAlive = true;
  }

  
//FUNCTIONS 

  //start timer
  void runTimer(){
  currentTime = millis();
  println(millis());
  text(millis()-startTime, 450, 75);
  }
  
  //stop timer
  void stopTimer(){
    if(playerIsAlive) {
    highscore = currentTime-startTime;
    playerIsAlive = false;
    }
  }
  
  //function to print the high score    
    void highScore(){
      if(playerIsAlive) {
        text("Highscore:  " + millis(), 100, 100);
      } else{
         text("Highscore:  " + highscore, 100, 100);
}
}
}
