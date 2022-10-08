class UI{
  
  //MainMenu
  float playButtonWidthAmount = 300;
  float playButtonHeightAmount = 100;
  
  float playButtonXPosAmount = displayWidth / 2 - playButtonWidthAmount / 2;
  float playButtonYPosAmount = displayHeight / 1.5 - playButtonHeightAmount / 2;
  
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
    
    float playButtonWidth = playButtonWidthAmount * (displayWidth / 1920);
    float playButtonHeight = playButtonHeightAmount * (displayHeight / 1080);
    float playButtonXPos = playButtonXPosAmount * (displayWidth / 1920);
    float playButtonYPos = playButtonYPosAmount * (displayHeight / 1080);
    
    fill(color(#F01E2F));
    rect(playButtonXPos, playButtonYPos, playButtonWidth, playButtonHeight);
    image(play, playButtonXPos, playButtonYPos, playButtonWidth, playButtonHeight);
  }
}
