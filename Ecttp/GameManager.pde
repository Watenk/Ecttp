class GameManager{
  
  public String currentScene;
  
  GameManager(){
    currentScene = "MainMenu";
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
