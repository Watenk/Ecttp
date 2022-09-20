class Rain{
  
  boolean canBeDeleted;
  boolean animation;
  
  float xPos = random(0 - displayWidth, displayWidth + displayWidth);
  float yPos = random(-5000, -400);
  float rainWidth = 50;
  float rainHeight = 50;
  
  float xSpeed = random(-2, 2);
  float ySpeed = random(15, 20);
  
  float alpha = random(10, 40);
  
  Animation Animation;
  float animationSize = random(25, 75);
  float animationXPos;
  
  //------------------------------
  
  Rain(){
    Animation = new Animation();
  }
  
  void Update(){
    
    //Calc
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
  
  void CalcSpeed(){
    xPos += xSpeed * windDirectionX * rainWeight;
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
