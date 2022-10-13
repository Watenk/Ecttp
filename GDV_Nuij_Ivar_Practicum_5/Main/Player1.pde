class Player1 extends Shape{
  
  float decelerationAmount = 0.5;
  float movementSpeed = 5;
  
  boolean touchingRoof;
  boolean touchingWallRight;
  boolean touchingWallLeft;
  boolean touchingFloor;
  
  //-----------------------------------
  
  Player1(float _xPos, float _yPos, float _width, float _height, float _scale) {
    super(_xPos, _yPos, _width, _height, _scale, 1);
    super.Update();
  }
    
  void Update(){
   
    CalcSpeed();
    WallCollision();
    Inputs();
    
    fill(0, 150, 0);
    super.Update();
  }
  
  //---------------------------------
  
  void CalcSpeed(){
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
        yPos = displayHeight - 1 - Height;
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
        xPos = displayWidth - 1 - Width;
      }
      touchingWallRight = true;
    }
    else{
      touchingWallRight = false;
    }
  }
  
  void Inputs(){
    if (w == true && !touchingRoof){
      ySpeed = -movementSpeed;
    }
    
    if (d == true && !touchingWallRight){
      xSpeed = movementSpeed;
    }
    
    if (s == true && !touchingFloor){
      ySpeed = movementSpeed;
    }
    
    if (a == true && !touchingWallLeft){
      xSpeed = -movementSpeed;
    }
  }
}
