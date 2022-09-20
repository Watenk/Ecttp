class Wind{
  
  float maxSpeed = 5;
  float windTimer;
  
  Wind(){
    windSpeedX = 1;
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
    if (windSpeedX >= maxSpeed){
       windSpeedX -= windChangeAmount;
    }
    
    if (windSpeedX <= -maxSpeed){
      windSpeedX += windChangeAmount;
    }
    
    if (windSpeedX <= maxSpeed && windSpeedX >= -maxSpeed){
      windSpeedX = random(windSpeedX - windChangeAmount, windSpeedX + windChangeAmount);
    }
  }
}
