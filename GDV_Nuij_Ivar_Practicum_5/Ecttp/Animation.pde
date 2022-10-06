class Animation{

  boolean isDone;
  int currentFrame = 1;
  
  Animation(){
  }

  void Play(PImage[] frames, int frameAmount, float xPos, float yPos, float animationWidth, float animationHeight){
    
    if (currentFrame == frameAmount){
      isDone = true;
    }
    else{
    image(frames[currentFrame], xPos, yPos, animationWidth, animationHeight);
    currentFrame += 1;  
    }
  }
}
