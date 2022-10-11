class GameManager{
  
  public String currentScene;
  
  GameManager(){
    currentScene = "TitleScreen";
    SetupTitleScreen();
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
  
  void SetupTitleScreen(){
    backgroundMusic.play();
    
    CubePhysicsManager.AddCubesRandom(100, displayWidth - 100, -20000, -10000, 1000);
    rainAmount = 10;
  }
  
  void TitleScreen(){
    UI.TitleScreen();
  }
  
  void SetupLvl01(){
    Player1 = new Player1();
    println("Player");
  }
  
  void Lvl01(){
    Player1.Update();
  }
}
