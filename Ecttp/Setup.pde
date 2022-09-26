class Setup{
  //To get around the max 5000ms loadtime in processing

  Setup(){
    
  //Instance Classes
  CubePhysicsManager = new CubePhysicsManager();
  GameManager = new GameManager();
  ScreenBorders = new ScreenBorders();
  Wind = new Wind();
  UI = new UI();
  RainManager = new RainManager();
  Player1 = new Player1();
  enemy1 = new Enemy();
  
  //Instance Arrays
  rainList = new ArrayList<Rain>();
  cubePhysicsList = new ArrayList<CubePhysics>();
  frameMillisList = new FloatList();
  
  //Sound
  backgroundMusic = new SoundFile(Ecttp.this, "sound/backgroundMusic.mp3");
  //backgroundMusic.play();
  hit = new SoundFile(Ecttp.this, "sound/hit.wav");
  
  //Sprites
  rainDrop = loadImage("sprites/rainDrop.png");
  cubeImage = loadImage("sprites/cubeImage.png");
  
  //Animations
  AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
  
  CubePhysicsManager.AddCubes();
  
  textSize(12);
  }
  
}
