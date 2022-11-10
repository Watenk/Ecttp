class GameManager {

  public String currentScene;

  boolean titleScreenSetup;
  boolean lvl01Setup;

  int difficulty = 40; // the lower the more difficult

  //Scores
  String highScore = "0";
  String highTime = "0";
  String[] newHighScores;
  String[] loadHighScores;
  int score = 1;

  //Timers
  int time = 1;
  int timer;
  int summonTimer;
  int bombTimer;
  int bombTimerAmount = int(random(80, 120));
  float summonTimerAmount = 10;

  float loseBar;

  public Camera Camera;

  GameManager() {
    currentScene = "TitleScreen";

    loadHighScores = loadStrings("highScore.txt");
    highScore = loadHighScores[0];
    highTime = loadHighScores[1];
    newHighScores = new String[2];

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

    CubeManager.cubeList.clear();
    CubeManager.AddCubesRandom(100, (displayWidth - 100), -30000, -100, 100, 100, 0.2, 0.2, 10, 2000, 20);
    //BombManager.AddBomb(300, 300, 50, 50, 50, 50, 1, 1, 1);
    
    RainManager.rainAmount = 0;
  }

  void TitleScreen() {
    if (!titleScreenSetup) {
      SetupTitleScreen();
      titleScreenSetup = true;
      lvl01Setup = false;
    }

    UI.TitleScreen();
  }
  //-----------------------------

  void SetupLvl01() {

    RainManager.rainAmount = 0;

    //EnemyManager.AddEnemy(100, 100, 100, 100, 2, 2, 1, 10, 2);

    CubeManager.cubeList.clear();

    Player1 = new Player1(displayWidth / 2 - (250 / 2), displayHeight - 500, 250, 50, 1);
    Collision.playerExists = true;
    Camera.Play(10, 25, 80, 45, 3, "RGB");
    //Camera.Play(0, 0, 80, 45, 10, "GrayScale");
    //Camera.Play(0, 0, 80, 45, 10, "Characters");
    //Camera.Play(0, 0, 250, 200, 4, "BlackOrWhite");
  }

  void Lvl01() {
    if (!lvl01Setup) {
      SetupLvl01();
      lvl01Setup = true;
      titleScreenSetup = false;
    }
    
    RainManager.rainAmount = score / 100;
    
    //Timers
    timer += 1;
    if (timer == 60) {
      timer = 0;
      time += 1;
      score += 1;
      summonTimer += 1;
      bombTimer += 1;
      if (loseBar >= 1) loseBar *= 0.8;
    }
    
    if (bombTimer > bombTimerAmount){
      BombManager.AddRandomBomb(100, displayWidth - 100, -2000, -100, 50, 50, 40, 60, 40, 60, 1, 1, int(random(1, 2)));
      bombTimer = 0;
      bombTimerAmount = int(random(80, 120));
    }

    //Summon cubes in certain time interfall - scales difficulty with score
    if(summonTimerAmount > 1) summonTimerAmount = 10 - (score / (10 * difficulty));
    if (summonTimer >= summonTimerAmount) {
      CubeManager.AddCubesRandom(100, (displayWidth - 100), -3000, -100, 100, 100, 0.2, 0.2, 10, 3 + (int(score / (5 * difficulty))), 5 + (score / (5 * difficulty)));
      summonTimer = 0;
    }

    //LoseBar
    if (loseBar > 250) {
      
      //Save HighScore
      if (score > int(highScore)) {
        newHighScores[0] = str(score);
      } else {
        newHighScores[0] = highScore;
      }

      if (time > int(highTime)) {
        newHighScores[1] = str(time);
      } else {
        newHighScores[1] = highTime;
      }
      saveStrings("highScore.txt", newHighScores);
      highScore = newHighScores[0];
      highTime = newHighScores[1];
      
      //reset stats
      loseBar = 0;
      score = 1;
      time = 1;
      timer = 0;
      summonTimer = 0;
      summonTimerAmount = 10;

      currentScene = "TitleScreen";
    }
    fill(loseBar, map(loseBar, 0, 255, 255, 0), 0, 100);
    rect(0, displayHeight - 400, displayWidth, 50);

    UI.GameScreen();

    Player1.Update();
    Camera.Update();
  }
}
