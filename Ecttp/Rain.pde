class Rain{
  
  boolean canBeDeleted = false;
  
  float xPos = random(10, displayWidth - 10);
  float yPos = random(-5000, -400);
  float rainWidth = 10;
  float rainHeight = 50;
  
  float fallXAmount = random(-2, 2);
  float fallYAmount = random(5, 10);
  
  float alpha = random(10, 40);
  
  //------------------------------
  
  Rain(){
  }
  
  
  void Update(){
    
    //Calc
    xPos += fallXAmount;
    yPos += fallYAmount;
    
    collision();
    
    //Draw
    fill(0, 0, 200, alpha);
    rect(xPos, yPos, rainWidth, rainHeight);
  }
  
  //--------------------------------
  
  void collision(){
  
    if(xPos > displayWidth || xPos <= 0){
      
      fallXAmount = fallXAmount * -1;
      
    }
    
    if(yPos > displayHeight + 100){
    
      canBeDeleted = true;
    
    }
  }
}
