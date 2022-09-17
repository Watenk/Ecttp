class Player{
  
  float playerScale = 0.5;
  float playerWidth = 50 * playerScale;
  float playerHeight = 115 * playerScale;
  float decelerationAmount = 0.5;
  float movementSpeed = 10;
  
  boolean touchingRoof;
  boolean touchingWallRight;
  boolean touchingWallLeft;
  boolean touchingFloor;
  
  float xSpeed;
  float ySpeed;
  
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
    CalcPoints();
  }
    
  void Update(){
   
    Inputs();
    
    WallCollision();
    
    CalcSpeed();
    
    CalcPoints();
    DrawLines();
    //DrawDebugPoints();
  }
  
  //---------------------------------
  
  void CalcSpeed(){
    xPos += xSpeed;
    yPos += ySpeed;
    
    if (xSpeed >= 0.1){
      xSpeed -= decelerationAmount;
    }
    
    if (xSpeed <= -0.1){
      xSpeed += decelerationAmount;
    }
    
    if (ySpeed >= 0.1){
      ySpeed -= decelerationAmount;
    }
    
    if (ySpeed <= -0.1){
      ySpeed += decelerationAmount;
    }
    
    //Speed is 0 if speed is lower then 0.1
    if (xSpeed <= 0.1 && xSpeed >= -0.1){
      xSpeed = 0;
    }
    
    if (ySpeed <= 0.1 && ySpeed >= -0.1){
      ySpeed = 0;
    }
  }
  
  void WallCollision(){
    if (yPos <= 1 || yPos2 <= 1){
      if (touchingRoof == false){
        ySpeed = 0;
        yPos = 0;
      }
      touchingRoof = true;
    }
    else{
      touchingRoof = false;
    }
    
    if (yPos3 >= displayHeight - 1 || yPos4 >= displayHeight - 1){
      if (touchingFloor == false){
        ySpeed = 0;
        yPos = displayHeight - 1 - playerHeight;
      }
      touchingFloor = true;
    }
    else{
      touchingFloor = false;
    }
    
    if (xPos <= 1){
      if (touchingWallLeft == false){
        xSpeed = 0;
        xPos = 0;
      }
      touchingWallLeft = true;
    }
    else{
      touchingWallLeft = false;
    }
    
    if (xPos2 >= displayWidth - 1){
      if (touchingWallRight == false){
        xSpeed = 0;
        xPos = displayWidth - 1 - playerWidth;
      }
      touchingWallRight = true;
    }
    else{
      touchingWallRight = false;
    }
  }
  
  void DrawLines(){
    line(xPos, yPos, xPos2, yPos2);
    line(xPos2, yPos2, xPos4, yPos4);
    line(xPos4, yPos4, xPos3, yPos3);
    line(xPos3, yPos3, xPos, yPos);
  }
  
  void Inputs(){
    if (w == true && !touchingRoof){
      GoUp();
    }
    
    if (d == true && !touchingWallRight){
      GoRight();
    }
    
    if (s == true && !touchingFloor){
      GoDown();
    }
    
    if (a == true && !touchingWallLeft){
      GoLeft();
    }
  }
  
  void GoRight(){
    xSpeed = movementSpeed;
  }
  
  void GoLeft(){
    xSpeed = -movementSpeed;
  }
  
  void GoUp(){
    ySpeed = -movementSpeed;
  }
  
  void GoDown(){
    ySpeed = movementSpeed;
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
  
  void DrawDebugPoints(){
    fill(100, 0, 0, 255);
    rect(xPos, yPos, 2, 2);
    rect(xPos2, yPos2, 2, 2);
    rect(xPos3, yPos3, 2, 2);
    rect(xPos4, yPos4, 2, 2);
    rect(xPos5, yPos5, 2, 2);
  }
}
