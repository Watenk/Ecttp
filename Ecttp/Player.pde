class Player{

  float speed = 10;
  
  float playerWidth = 220;
  float playerHeight = 115;
  
  float xPos = displayWidth / 2;
  float yPos = displayHeight - playerHeight;
  
  //-----------------------------------
  
  Player() {
  }
    
  void Update(){
  
    fill(0, 200, 0, 255);
    rect(xPos, yPos, playerWidth, playerHeight);
    
    if (UI.w == true){
      GoUp();
    }
    
    if (UI.d == true){
      GoRight();
    }
    
    if (UI.s == true){
      GoDown();
    }
    
    if (UI.a == true){
      GoLeft();
    }
  }
  
  //---------------------------------
  
  void GoRight(){
    xPos += speed;
  }
  
  void GoLeft(){
    xPos -= speed;
  }
  
  void GoUp(){
    yPos -= speed;
  }
  
  void GoDown(){
    yPos += speed;
  }
}
