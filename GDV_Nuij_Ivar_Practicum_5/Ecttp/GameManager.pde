class GameManager{
  
  public String currentScene;
  
  GameManager(){
    currentScene = "MainMenu";
    
    //MainMenu

    CubePhysicsManager.AddCubes(481, 930, 1, 10);
    CubePhysicsManager.AddCubes(500, 950, 1, 10);

    //CubePhysicsManager.AddCubes(690, 100, 1, 11);
    //CubePhysicsManager.AddCubes(700, 150, 1, 10);
    
    CubePhysicsManager.AddCubesRandom(0, displayWidth, -500, 0, 500);
  }
  
  void Update(){
    
    switch(currentScene) {
      case "MainMenu":
        MainMenu();
        UI.MainMenu();
        break;
        
      case "Lvl01":
      
        break;
        
      default:
        break;
    }
  }
  
  void MainMenu(){

  }
}
