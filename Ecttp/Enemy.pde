class Enemy{
  
  float enemyScale = 1;
  float enemyWidth = 60;
  float enemyHeight = 75;
  boolean becomeBigger;
  
  float xSpeed = random(10, 15);
  float ySpeed = random(1, 3);
  
  float xPos = random(0, displayWidth - 100);
  float yPos = 100;
  
  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;
  
  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;
  
  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4; 
  
  float cube1Width;
  float cube1Height;
  float xPosCube1; 
  
  float cube2Width;
  float cube2Height;
  float yPosCube2; 
  
  float cube3Width;
  float cube3Height;
  float xPosCube3; 
  float yPosCube3; 
  
  Enemy() {
  }
    
  void Update(){
  
    BiggerOrSmaller();
    
    WallCollision();
    
    CalcScale();
    CalcSpeed();
    
    CalcPoints();
    DrawEnemy();
  }
  
  void WallCollision(){
    if (xPos2 >= displayWidth || xPos <= 0){
      xSpeed *= -1;
    }
  }
  
  void BiggerOrSmaller(){
    if (enemyScale >= 1.1){
      becomeBigger = false;
    }
    
    if (enemyScale <= 0.5){
      becomeBigger = true;
    }
    
    if (becomeBigger == true){
      enemyScale += 0.005;
    }
    else{
      enemyScale -= 0.005;
    }
  }
  
  void CalcScale(){
    enemyWidth = 60;
    enemyHeight = 75;
    
    enemyWidth *= enemyScale;
    enemyHeight *= enemyScale;
  }
  
  void CalcPoints() {
    //reset points each frame
    xPos2 = xPos;
    yPos2 = yPos;
    xPos3 = xPos;
    yPos3 = yPos;
    xPos4 = xPos;
    yPos4 = yPos;
    
    xPosCube1 = xPos;
    yPosCube2 = yPos;
    xPosCube3 = xPos;
    yPosCube3 = yPos;
    
    //points positions
    xPos2 += enemyWidth;
    yPos3 += enemyHeight;
    xPos4 += enemyWidth;
    yPos4 += enemyHeight;
    
    cube1Width = 15 * enemyScale;
    cube1Height = 15 * enemyScale;
    cube2Width = 60 * enemyScale;
    cube2Height = 30 * enemyScale;
    cube3Width = 50 * enemyScale;
    cube3Height = 30 * enemyScale;
    
    xPosCube1 += 22.5 * enemyScale;
    yPosCube2 += 15 * enemyScale;
    xPosCube3 += 5 * enemyScale;
    yPosCube3 += 45 * enemyScale;
  }
  
  void DrawEnemy(){
    fill(200, 0, 0, 255);
    rect(xPos, yPos, enemyWidth, enemyHeight);
    
    fill(250, 0, 0, 255);
    rect(xPosCube1, yPos, cube1Width, cube1Height);
    rect(xPos, yPosCube2, cube2Width, cube2Height);
    rect(xPosCube3, yPosCube3, cube3Width, cube3Height);
  }
  
  void CalcSpeed(){
    xPos += xSpeed;
    yPos += ySpeed;
  }
}
