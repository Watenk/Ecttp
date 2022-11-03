class GameManager {

  public String currentScene;

  boolean titleScreenSetup;
  boolean lvl01Setup;
  
  int playerScore;

  public Camera Camera;

  GameManager() {
    currentScene = "TitleScreen";

    Camera = new Camera();
  }

  void Update() {

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

  void SetupTitleScreen() {
    //backgroundMusic.play();

    CubeManager.AddCubesRandom(100, (displayWidth - 100), -30000, -100, 100, 100, 0.2, 10, 1000);
    RainManager.rainAmount = 0;
  }

  void TitleScreen() {
    if (!titleScreenSetup) {
      SetupTitleScreen();
      titleScreenSetup = true;
    }


    UI.TitleScreen();
  }
  //-----------------------------

  void SetupLvl01() {
    
    RainManager.rainAmount = 10;
    
    //Enemy's
    EnemyManager.AddEnemy(100, 100, 100, 100, 2, 2, 1, 10, 2);
    CubeManager.cubeList.clear();
    CubeManager.AddCubesRandom(100, (displayWidth - 100), -100000, -100, 100, 100, 0.2, 10, 1000);
    
    Player1 = new Player1(displayWidth / 2 - (250 / 2), displayHeight - 300, 250, 50, 1);
    Collision.playerExists = true;
    Camera.Play(-1000, -1000, 80, 45, 10, "RGB");
    //Camera.Play(0, 0, 80, 45, 10, "GrayScale");
    //Camera.Play(0, 0, 80, 45, 10, "Characters");
    //Camera.Play(0, 0, 250, 200, 4, "BlackOrWhite");
  }

  void Lvl01() {
    if (!lvl01Setup) {
      SetupLvl01();
      lvl01Setup = true;
    }

    Player1.Update();
    Camera.Update();
  }
}
