class GameManager{
  
  public String currentScene;
  
  GameManager(){
    currentScene = "MainMenu";
    
    //MainMenu
    CubePhysicsManager.AddCubes(500, 500, 2, 10);
    CubePhysicsManager.AddCubesRandom(0, displayWidth, -500, 0, 500, 10);
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
