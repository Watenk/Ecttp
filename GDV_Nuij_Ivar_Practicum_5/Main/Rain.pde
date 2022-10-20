class Rain{
  
  boolean canBeDeleted;
  boolean animation;
  
  float rainScale = 1;
  int xPos = int(random(0 - (displayWidth / 2), displayWidth + (displayWidth / 2)));
  int yPos = int(random(-5000, -400));
  float rainWidthAmount = 50;
  float rainHeightAmount = 50;
  
  float rainWidth;
  float rainHeight;
  
  float xSpeed = random(-1, 1);
  float ySpeed = random(15, 20);
  
  float alpha = random(10, 40);
  
  Animation AnimationRainSplash;
  int animationXPos;
  
  //------------------------------
  
  Rain(){
    AnimationRainSplash = new Animation();
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
    
    if(yPos > displayHeight && !animation){
      animation = true;
      animationXPos = xPos;
    }
  }
  
  void SplashAnimation(){
    AnimationRainSplash.Play(PixelImageRainSplash, 20, animationXPos, displayHeight - 125);
      
    if (AnimationRainSplash.isDone == true){
      canBeDeleted = true;
    }
  }
}
