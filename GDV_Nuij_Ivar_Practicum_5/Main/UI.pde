class UI{
  
  //TitleScreen
  //Title
  float titleWidth = 1280;
  float titleHeight = 720;
  float titleXPos = displayWidth / 2 - titleWidth / 2;
  float titleYPos = displayHeight / 4 - titleHeight / 2;
  
  //PlayButton
  float playButtonWidth = 300;
  float playButtonHeight = 100;
  float playButtonXPos = displayWidth / 2 - playButtonWidth / 2;
  float playButtonYPos = displayHeight / 1.5 - playButtonHeight / 2;

  
  UI() {
  }
  
  void update(){
    //Performance
    if (Time.smoothFrameRate < 30){
      fill(255, 0, 0);
      text(int(Time.smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
      text("Considerably", 122, 20);
    }
    if (Time.smoothFrameRate <= 60 && Time.smoothFrameRate >= 30){
      fill(215, 115, 0);
      text(int(Time.smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
    }
    if (Time.smoothFrameRate >= 60){
      fill(0, 100, 0);
      text(int(Time.smoothFrameRate), 10, 20);
    }
  }
  
  public void TitleScreen(){
    //Title
    float titleWidthScale = titleWidth * (displayWidth / 1920);
    float titleHeightScale = titleHeight * (displayWidth / 1920);
    float titleXPosScale = titleXPos * (displayWidth / 1920);
    float titleYPosScale = titleYPos * (displayWidth / 1920);
    
    image(title, titleXPosScale, titleYPosScale, titleWidthScale, titleHeightScale);
    
    //Play Button    
    float playButtonWidthScale = playButtonWidth * (displayWidth / 1920);
    float playButtonHeightScale = playButtonHeight * (displayHeight / 1080);
    float playButtonXPosScale = playButtonXPos * (displayWidth / 1920);
    float playButtonYPosScale = playButtonYPos * (displayHeight / 1080);
    
    fill(color(#F01E2F));
    rect(playButtonXPosScale, playButtonYPosScale, playButtonWidthScale, playButtonHeightScale);
    image(play, playButtonXPosScale, playButtonYPosScale, playButtonWidthScale, playButtonHeightScale);
    
    if (mouseX >= playButtonXPosScale && mouseY >= playButtonYPosScale && mouseX <= playButtonXPosScale + playButtonWidthScale && mouseY <= playButtonYPosScale + playButtonHeightScale && mousePressed == true){ //If mouse is in play button and mouseclick, load scene
      GameManager.currentScene = "lvl01";
      CubeManager.cubeList.clear();
      GameManager.SetupLvl01();
    }
  }
}
