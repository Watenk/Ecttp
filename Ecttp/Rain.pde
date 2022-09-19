class Rain{
  
  boolean canBeDeleted;
  boolean startRainSplash;
  
  float xPos = random(10, displayWidth - 10);
  float yPos = random(-5000, -400);
  float rainWidth = 50;
  float rainHeight = 50;
  
  float xSpeed = random(-2, 2);
  float ySpeed = random(15, 20);
  
  float alpha = random(10, 40);
  
  float animationTimer;
  int animationFrameCounter = 0;
  
  //------------------------------
  
  Rain(){
  }
  
  void Update(){
    
    //Calc
    xPos += xSpeed;
    yPos += ySpeed;
    
    collision();
    
    if (startRainSplash == true){
      RainSplash();
    }
    
    //Draw
    fill(0, 0, 200, alpha);
    image(rainDrop, xPos, yPos, rainWidth, rainHeight);
  }
  
  //--------------------------------
  
  void collision(){
  
    if(xPos > displayWidth || xPos <= 0){
      xSpeed *= -1;
    }
    
    if(yPos > displayHeight){
      startRainSplash = true;
    }
  }
  
  void RainSplash(){
    
    if (animationFrameCounter == 20){
      canBeDeleted = true;
    }
    
    ySpeed = 0;
    yPos = displayHeight - rainHeight;
      
    animationTimer += 1;
    
    if (animationTimer == 2){
      
      animationTimer = 0;
      animationFrameCounter += 1;
    }
  }
}
