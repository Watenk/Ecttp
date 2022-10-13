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
  
  void AddAnimation(PImage[] frames, String sprite, int frameAmount){
    for (int i=0; i < frameAmount; i += 1){
      String fileName = sprite + nf(i + 1, 4) + ".png";
      frames[i] = loadImage(fileName);
    } 
  }
}
