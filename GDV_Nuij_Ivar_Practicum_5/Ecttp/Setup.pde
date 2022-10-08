class Setup{
  //To get around the max 5000ms loadtime in processing

  Setup(){
    
  //Instance Classes
  CubePhysicsManager = new CubePhysicsManager();
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
  hit = new SoundFile(Ecttp.this, "sound/hit.wav");
  
  //Sprites
  rainDrop = loadImage("sprites/rainDrop.png");
  cubeImage = loadImage("sprites/cubeImage.png");
  play = loadImage("sprites/play.png");
  
  //Animations
  AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
  
  GameManager = new GameManager();
  
  textSize(12);
  }
}
