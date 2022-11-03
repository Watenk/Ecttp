public class Player1 extends Shape{
  
  PlayerCollision PlayerCollision;
  
  float decelerationAmount = 0.5;
  float movementSpeed = 5;
  
  boolean touchingRoof;
  boolean touchingWallRight;
  boolean touchingWallLeft;
  boolean touchingFloor;
  
  //-----------------------------------
  
  Player1(float _xPos, float _yPos, float _width, float _height, float _scale) {
    super(_xPos, _yPos, _width, _height, _scale, 1);
    super.Update();
    PlayerCollision = new PlayerCollision();
  }
    
  void Update(){
   
    CalcSpeed();
    PlayerCollision.Update();
    
    fill(0, 150, 0);
    super.Update();
  }
  
  //---------------------------------
  
  void CalcSpeed(){
    xPos = lerp(xPos, HandDetection.handPos, 0.1);
  }
}
