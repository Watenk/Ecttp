class CubePhysics{
  
  float gravity = 25;
  float acceleration = random(0.18, 0.22); 
  float impactDeceleration = 2; 
  
  boolean isTouchingGround = false;
  
  float xPos;
  float yPos;
  float cubeWidth = 100;
  float cubeHeight = 100;
  float cubeScale = 0.2;
 
  float xSpeed;
  float ySpeed;
  
  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;
  
  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;
  
  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4; 

  //----------------------------------
  
  CubePhysics(float _xPos, float _yPos){
    xPos = _xPos;
    yPos = _yPos;
  }

  void update() {
    
    WallCollision();
    
    CalcSpeed();
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
    cubeWidth = 100;
    cubeHeight = 100;
    
    cubeWidth *= cubeScale;
    cubeHeight *= cubeScale;
  }
  
  void WallCollision(){
    if (yPos3 >= displayHeight - 1|| yPos4 >= displayHeight - 1){
      
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
  }
  
  void CalcGravity(){
    if (ySpeed < gravity && isTouchingGround == false){
      ySpeed += acceleration;
    }
  }
  
  void CalcSpeed(){
    if (ySpeed <= 0.1 && ySpeed >= -0.1){
      ySpeed = 0;
    }
    
    xPos += xSpeed + windSpeedX / cubePhysicsWeight;
    yPos += ySpeed;
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
    line(xPos, yPos, xPos2, yPos2);
    line(xPos2, yPos2, xPos4, yPos4);
    line(xPos4, yPos4, xPos3, yPos3);
    line(xPos3, yPos3, xPos, yPos);
    
    fill(100, 100, 100, 255);
    rect(xPos, yPos, cubeWidth, cubeHeight);
  }
  
  void DrawDebugPoints(){
    fill(100, 0, 0, 255);
    rect(xPos, yPos, 2, 2);
    rect(xPos2, yPos2, 2, 2);
    rect(xPos3, yPos3, 2, 2);
    rect(xPos4, yPos4, 2, 2);
  }
}
