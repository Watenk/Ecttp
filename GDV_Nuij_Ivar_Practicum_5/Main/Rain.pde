class Rain{
  
  boolean canBeDeleted;
  boolean animation;
  
  float rainScale = 1;
  float xPos = random(0 - (displayWidth / 2), displayWidth + (displayWidth / 2));
  float yPos = random(-5000, -400);
  float rainWidthAmount = 50;
  float rainHeightAmount = 50;
  
  float rainWidth;
  float rainHeight;
  
  float xSpeed = random(-1, 1);
  float ySpeed = random(15, 20);
  
  float alpha = random(10, 40);
  
  Animation Animation;
  float animationSize = random(25, 75) * (displayWidth / 1920);
  float animationXPos;
  
  //------------------------------
  
  Rain(){
    Animation = new Animation();
  }
  
  void Update(){
    
    //Calc
    CalcScale();
    CalcSpeed();
    Collision();
    
    if (animation == true){
      SplashAnimation();
    }
    
    //Draw
    fill(0, 0, 200, alpha);
    image(rainDrop, xPos, yPos, rainWidth, rainHeight);
  }
  
  //--------------------------------
  
  void CalcScale(){
    rainWidth = rainWidthAmount * (displayWidth / 1920);
    rainHeight = rainHeightAmount * (displayHeight / 1080);
    
    rainWidth *= rainScale;
    rainHeight *= rainScale;
  }
  
  void CalcSpeed(){
    xPos += xSpeed + Wind.windSpeedX / RainManager.rainWeight;
    yPos += ySpeed;
  }
  
  void Collision(){
  
    if(xPos > displayWidth || xPos <= 0){
      xSpeed *= -1;
    }
    
    if(yPos > displayHeight){
      animation = true;
      animationXPos = xPos;
      yPos = -2000;
    }
  }
  
  void SplashAnimation(){
    Animation.Play(rainSplash, 20, animationXPos, displayHeight - animationSize, animationSize, animationSize);
      
    if (Animation.isDone == true){
      canBeDeleted = true;
    }
  }
}
