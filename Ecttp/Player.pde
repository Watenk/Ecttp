class Player{

  float xPos = 1000;
  float yPos = 900;
  float playerWidth = 80;
  float playerHeight = 150;
  
  Player() {
  }
    
  void Update(){
  
    fill(0, 200, 0, 255);
    rect(xPos, yPos, playerWidth, playerHeight);
    
  }
}
