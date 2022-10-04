class CubePhysics{
  
  float maxSpeed = 20;
  float acceleration = 0.2; 
  float impactDeceleration = 2; 
  float cubeWeight;
  
  boolean isTouchingGround = false;
  
  float cubeWidthAmount = 100;
  float cubeHeightAmount = 100;
  float cubeScale = 0.2;
 
  float cubeWidth;
  float cubeHeight;
 
  float xSpeed;
  float ySpeed;
  
  float xPos;
  float yPos;
  
  float xPosPrevious; 
  float yPosPrevious;
  
  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;
  
  float xPos2Previous;
  float yPos2Previous;
  
  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;
  
  float xPos3Previous;
  float yPos3Previous;
  
  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4; 
  
  float xPos4Previous;
  float yPos4Previous;

  //----------------------------------
  
  CubePhysics(float _xPos, float _yPos, float _cubeWeight){
    xPos = _xPos;
    yPos = _yPos;
    cubeWeight = _cubeWeight;
  }

  void update() {
    
    WallCollision();
    
    CalcPreviousPoints();
    
    CalcPos();
    CalcScale();
    
    CalcPoints();
    DrawCube();
    //DrawDebugPoints();
  }
  
  //-------------------------------------
  
  public void AddForce(){
    ySpeed = random(-5, -8);
  }
  
  void CalcScale(){
    //reset scale
    cubeWidth = cubeWidthAmount;
    cubeHeight = cubeHeightAmount;
    
    cubeWidth *= cubeScale * displayWidth / 1920;
    cubeHeight *= cubeScale * displayHeight / 1080;
  }
  
  void WallCollision(){
    //Ground
    if (yPos4 >= displayHeight - 1){
      
      isTouchingGround = true;

      float newYSpeed;
      newYSpeed = ySpeed / impactDeceleration * random(0.9, 1.1);
        
      yPos = displayHeight - cubeHeight;
      ySpeed = 0;
      ySpeed -= newYSpeed;
    }
    else{
      isTouchingGround = false;
    }
    
    //Walls
    if (xPos < 0){
      float newXSpeed;
      newXSpeed = xSpeed * -1 / impactDeceleration * random(0.9, 1.1);
      
      xPos = 0;
      xSpeed = 0;
      xSpeed += newXSpeed;
    }
    
    if (xPos4 > displayWidth){
      float newXSpeed;
      newXSpeed = xSpeed / impactDeceleration * random(0.9, 1.1);
      
      xPos = displayWidth - cubeWidth;
      xSpeed = 0;
      xSpeed -= newXSpeed;
    }
  }
  
  void CalcGravity(){
    if (ySpeed < maxSpeed && isTouchingGround == false){
      ySpeed += acceleration;
    }
  }
  
  void CalcPreviousPoints(){
    xPosPrevious = xPos;
    yPosPrevious = yPos;
    xPos2Previous = xPos2;
    yPos2Previous = yPos2;
    xPos3Previous = xPos3;
    yPos3Previous = yPos3;
    xPos4Previous = xPos4;
    yPos4Previous = yPos4;
  }
  
  void CalcPos(){
    xPos += xSpeed + windSpeedX / cubeWeight;
    yPos += ySpeed * cubeWeight / 10;
  }
  
  void CalcPoints() {
    //reset points each frame
    xPos2 = xPos;
    yPos2 = yPos;
    xPos3 = xPos;
    yPos3 = yPos;
    xPos4 = xPos;
    yPos4 = yPos;
    
    //points positions
    xPos2 += cubeWidth;
    yPos3 += cubeHeight;
    xPos4 += cubeWidth;
    yPos4 += cubeHeight;
  }
  
  void DrawCube(){
    image(cubeImage, xPos, yPos, cubeWidth, cubeHeight);
  }
  
  void DrawDebugPoints(){
    fill(100, 0, 0, 255);
    rect(xPos, yPos, 2, 2);
    rect(xPos2, yPos2, 2, 2);
    rect(xPos3, yPos3, 2, 2);
    rect(xPos4, yPos4, 2, 2);
  }
}
