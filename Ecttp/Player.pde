class Player{

  float speed = 10;
  
  float playerWidth = 50;
  float playerHeight = 115;
  
  float xPos = displayWidth / 2;
  float yPos = displayHeight - playerHeight;
  
  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;
  
  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;
  
  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4; 
  
  float xPos5; // Pos 5 is the middle of the rect
  float yPos5;
  
  //-----------------------------------
  
  Player() {
  }
    
  void Update(){
    
    Inputs();
    
    CalcPoints();
    DrawLines();
  }
  
  //---------------------------------
  
  void DrawLines(){
    line(xPos, yPos, xPos2, yPos2);
    line(xPos2, yPos2, xPos4, yPos4);
    line(xPos4, yPos4, xPos3, yPos3);
    line(xPos3, yPos3, xPos, yPos);
  }
  
  void Inputs(){
    if (w == true){
      GoUp();
    }
    
    if (d == true){
      GoRight();
    }
    
    if (s == true){
      GoDown();
    }
    
    if (a == true){
      GoLeft();
    }
  }
  
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
  
  void CalcPoints() {
  //reset points each frame
  xPos2 = xPos;
  yPos2 = yPos;
  xPos3 = xPos;
  yPos3 = yPos;
  xPos4 = xPos;
  yPos4 = yPos;
  xPos5 = xPos;
  yPos5 = yPos;
    
  //points positions
  xPos2 += playerWidth;
  yPos3 += playerHeight;
  xPos4 += playerWidth;
  yPos4 += playerHeight;
  xPos5 += playerWidth / 2;
  yPos5 += playerHeight / 2;
  }
}
