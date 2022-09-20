class Wind{
  
  float maxSpeed = 2;
  float windTimer;
  
  Wind(){
    windDirectionX = 1;
    ChangeWindDirection();
  }
  
  void Update(){
    windTimer += 1;
    
    if (windTimer >= windChangeTime){
      ChangeWindDirection();
      windTimer = 0;
    }
  }
  
  void ChangeWindDirection(){
    if ( windDirectionX >= maxSpeed){
       windDirectionX -= windChangeAmount;
    }
    
    if (windDirectionX <= -maxSpeed){
      windDirectionX += windChangeAmount;
    }
    
    if (windDirectionX <= maxSpeed && windDirectionX >= -maxSpeed){
      windDirectionX = random(windDirectionX - windChangeAmount, windDirectionX + windChangeAmount);
    }
    
    println(windDirectionX);
  }
}
