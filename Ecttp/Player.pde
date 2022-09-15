class Player{

  float playerWidth = 220;
  float playerHeight = 115;
  
  float xPos = displayWidth / 2;
  float yPos = displayHeight - playerHeight;
  
  Player() {
  }
    
  void Update(){
  
    fill(0, 200, 0, 255);
    rect(xPos, yPos, playerWidth, playerHeight);
    
  }
}
