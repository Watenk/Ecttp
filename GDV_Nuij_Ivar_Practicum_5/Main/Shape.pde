class Shape{
  
  float Scale;
  float Weight;
  
  float Width;
  float Height;
  
  float previousWidth;
  float previousHeight;
  
  float widthUnscaled;
  float heightUnscaled;
 
  float xSpeed;
  float ySpeed;
  
  float xPos;
  float yPos;

  float xPos2; // Pos 2 is the right up point of rect
  float yPos2;

  float xPos3; // pos 3 is the left bottom point of rect
  float yPos3;

  float xPos4; // Pos 4 is the right bottom point of rect
  float yPos4; 
  
  Shape(float _xPos, float _yPos, float _width, float _height, float _Scale, float _Weight){
    xPos = _xPos;
    yPos = _yPos;
    widthUnscaled = _width;
    heightUnscaled = _height;
    previousWidth = Width *= Scale * displayWidth / 1920;
    previousHeight = Height *= Scale * displayWidth / 1920;
    Scale = _Scale;
    Weight = _Weight;
  }
  
  void Update(){
    CalcShape();
    DrawShape();
    //DrawDebugPoints();
  }
  
  void CalcShape(){
    xPos += (xSpeed + Wind.windSpeedX) / Weight;
    yPos += ySpeed * Weight / 10;
    
    //Scale
    //Width / Height
    Width = widthUnscaled;
    Height = heightUnscaled;
    
    Width *= Scale * displayWidth / 1920;
    Height *= Scale * displayWidth / 1920;
    
    //xPos and yPos
    xPos += (previousWidth - Width) /2;
    yPos += (previousHeight - Height) /2;
    
    previousWidth = Width;
    previousHeight = Height;
    
    //Points
    xPos2 = xPos;
    yPos2 = yPos;
    xPos3 = xPos;
    yPos3 = yPos;
    xPos4 = xPos;
    yPos4 = yPos;
    xPos2 += Width;
    yPos3 += Height;
    xPos4 += Width;
    yPos4 += Height;
  }
  
  void DrawShape(){
    rect(xPos, yPos, Width, Height);
  }
  
  void DrawDebugPoints(){
    fill(100, 0, 0, 255);
    rect(xPos, yPos, 2, 2);
    rect(xPos2, yPos2, 2, 2);
    rect(xPos3, yPos3, 2, 2);
    rect(xPos4, yPos4, 2, 2);
  }
}
