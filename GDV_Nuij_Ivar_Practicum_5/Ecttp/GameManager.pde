class GameManager{
  
  public String currentScene;
  
  GameManager(){
    currentScene = "MainMenu";
    
    //MainMenu
    
    //backgroundMusic.play();
    
    CubePhysicsManager.AddCubes(481, 930, 1, 10);
    CubePhysicsManager.AddCubes(500, 950, 1, 10);

    //CubePhysicsManager.AddCubes(690, 100, 1, 11);
    //CubePhysicsManager.AddCubes(700, 150, 1, 10);
    
    CubePhysicsManager.AddCubesRandom(100, displayWidth - 100, 0, 500, 2000);
  }
  
  void Update(){
    
    switch(currentScene) {
      case "MainMenu":
        MainMenu();
        break;
        
      case "Lvl01":
      
        break;
        
      default:
        break;
    }
  }
  
  void MainMenu(){
    UI.MainMenu();
  }
}
