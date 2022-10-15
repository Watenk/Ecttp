class GameManager{
  
  public String currentScene;
  
  boolean titleScreenSetup;
  boolean lvl01Setup;
  
  GameManager(){
    currentScene = "TitleScreen";
  }
  
  void Update(){
    
    switch(currentScene) {
      case "TitleScreen":
        TitleScreen();
        break;
        
      case "Lvl01":
        Lvl01();
        break;
        
      default:
        break;
    }
  }
  
  //------------------------------
  
  void SetupTitleScreen(){
    //backgroundMusic.play();
    
    CubeManager.AddCubesRandom(100, (displayWidth - 100), -30000, -100, 100, 100, 0.2, 10, 1000);
    RainManager.rainAmount = 10;
  }
  
  void TitleScreen(){
    if (!titleScreenSetup) {SetupTitleScreen(); titleScreenSetup = true;}
    
    
    UI.TitleScreen();
  }
  //-----------------------------
  
  void SetupLvl01(){
    EnemyManager.AddEnemy(100, 100, 100, 100, 2, 2, 1, 10, 2);
    Player1 = new Player1(displayWidth / 2 - (250 / 2), displayHeight + 50, 250, 50, 1);
    
    PixelVideo.Play("ai.mp4", 0, 0, 427, 240, 4, "");
    //PixelVideo.Play("ai.mp4", 100, 10, 427, 240, 3, "Characters");
    
    //Camera.Play(0, 0, 320, 180, 5, "");
    //Camera.Play(0, 0, 160, 90, 10, "");
    
    //Camera.Play(0, 0, 500, 300, 3, "Characters");
    //Camera.Play(0, 0, 320, 180, 5, "Characters");
  }
  
  void Lvl01(){
    if (!lvl01Setup) {SetupLvl01(); lvl01Setup = true;}
    
    Player1.Update();
  }
}
