class CubePhysics{
  
  float gravity = 50;
  float acceleration = 0.2; 
  float impactDeceleration = 2; 
  boolean isTouchingGround = false;
  
  float xPos = 100;
  float yPos = 100;
  float cubeWidth = 100;
  float cubeHeight = 100;
 
  float xSpeed;
  float ySpeed;
  
  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;
  
  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;
  
  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4;

  //----------------------------------
  
  CubePhysics(){
  }

  void update() {
  
    //CALC
    
    //GroundCollision
    if (yPos3 >= displayHeight || yPos4 >= displayHeight){
      
      isTouchingGround = true;
      
      if (ySpeed >= 0.01){
        float newYSpeed;
        newYSpeed = ySpeed / impactDeceleration;
        
        ySpeed = 0;
        ySpeed -= newYSpeed;
      }
      else{
        
        if (ySpeed > 0){
        
          ySpeed = 0;
        }

        yPos = displayHeight - cubeHeight;
      }
    }
    else{
    
      isTouchingGround = false;
    }
    
    //Gravity
    if (ySpeed < gravity && isTouchingGround == false){
    
      ySpeed += acceleration;
    }

    //Speed
    xPos += xSpeed;
    yPos += ySpeed;
    
    //Points
    //reset points each frame
    //ResetPoint(xPos4, yPos4);
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

    //DRAW
    fill(100, 100, 100, 255);
    rect(xPos, yPos, cubeWidth, cubeHeight);

    //Debug
    fill(100, 0, 0, 150);
    rect(xPos, yPos, 10, 10);
    rect(xPos2, yPos2, 10, 10);
    rect(xPos3, yPos3, 10, 10);
    rect(xPos4, yPos4, 10, 10);
  }
  
  //-------------------------------------
  
  //void ResetPoint(float _xPos, float _yPos) {
    
    //_yPos = yPos;
  //}
  
  public void AddForce(){
    
    ySpeed = -10;
  }
}
