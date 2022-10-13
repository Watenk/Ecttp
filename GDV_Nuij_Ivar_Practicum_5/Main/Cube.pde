class Cube extends Shape{
  
  float maxSpeed = 20;
  float gravity = 0.2; 
  float impactDeceleration = 2;
  
  boolean isTouchingGround = false;
 
  //----------------------------------

  Cube(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _Scale, float _Weight){
    super(_xPos, _yPos, _cubeWidth, _cubeHeight, _Scale, _Weight);
  }
  
  //-------------------------------------
  
  void Update(){
    CalcGravity();
    CubeCollision();
    Color();
    super.Update();
  }
  
  void CalcGravity(){
    if (ySpeed < maxSpeed){ 
      ySpeed += gravity;
    }
  }
  
  void Color(){
    float colorRHeight = map(yPos4, 0, displayHeight, 0, 255);
    float colorGHeight = map(yPos4, 0, displayHeight, 255, 0);
    fill(colorRHeight, colorGHeight, 0);
  }
  
  void CubeCollision(){
    //Ground
    if (yPos4 >= displayHeight - 1){
      
      isTouchingGround = true;

      float newYSpeed;
      newYSpeed = ySpeed / impactDeceleration * random(0.9, 1.1);
        
      yPos = displayHeight - Height;
      ySpeed = 0;
      ySpeed -= newYSpeed;
      
      if (ySpeed < -1.5 && currentSoundPlays < maxSoundPlays){ hit.play(); currentSoundPlays += 1;}
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
      
      xPos = displayWidth - Width;
      xSpeed = 0;
      xSpeed -= newXSpeed;
    }
  }
  
  public void AddForce(){
    ySpeed = random(-5, -8);
  }
}
