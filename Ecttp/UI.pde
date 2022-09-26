class UI{
  
  //MainMenu
  float playButtonWidthAmount = 300;
  float playButtonHeightAmount = 100;
  
  float playButtonXPosAmount = 960 - playButtonWidthAmount / 2;
  float playButtonYPosAmount = 540 - playButtonHeightAmount / 2;
  
  float playButtonXPos;
  float playButtonYPos;
  
  float playButtonWidth;
  float playButtonHeight;
  
  UI() {
  }
  
  void update(){
    //Performance
    if (smoothFrameRate < 30){
      fill(255, 0, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
      text("Considerably", 122, 20);
    }
    if (smoothFrameRate <= 60 && smoothFrameRate >= 30){
      fill(215, 115, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
    }
    if (smoothFrameRate >= 60){
      fill(0, 100, 0);
      text(int(smoothFrameRate), 10, 20);
    }
  }
  
  public void MainMenu(){
    //Play Button
    //Scale With Screen Size
    playButtonWidth = playButtonWidthAmount * (displayWidth / 1920);
    playButtonHeight = playButtonHeightAmount * (displayHeight / 1080);
    playButtonXPos = playButtonXPosAmount * (displayWidth / 1920);
    playButtonYPos = playButtonYPosAmount * (displayHeight / 1080);
    
    fill(200);
    rect(playButtonXPos, playButtonYPos, playButtonWidth, playButtonHeight);
  }
}
