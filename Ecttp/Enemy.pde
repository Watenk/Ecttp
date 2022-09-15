class Enemy{
  
  float xPos = 500;
  float yPos = 500;
  
  Enemy() {
  }
    
  void Update(){
  
    yPos += 1;
    
    //Other enemy
    fill(200, 0, 0, 255);
    rect(xPos + 5, yPos + 40, 50, 30);
    rect(xPos, yPos + 10, 60, 30);
    rect(xPos + 23, yPos, 15, 15);
  }
}
