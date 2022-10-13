class Setup{
  //To get around the max 5000ms loadtime in processing

  Setup(){
    
  //Instance Classes
  Time = new Time();
  CubeManager = new CubeManager();
  Wind = new Wind();
  UI = new UI();
  RainManager = new RainManager();
  enemy1 = new Enemy();
  
  //Instance Arrays
  RainManager.rainList = new ArrayList<Rain>();
  CubeManager.cubeList = new ArrayList<Cube>();
  Time.frameMillisList = new FloatList();
  
  //Sound
  backgroundMusic = new SoundFile(Main.this, "sound/backgroundMusic.mp3");
  hit = new SoundFile(Main.this, "sound/hit.wav");
  
  //Sprites
  rainDrop = loadImage("sprites/rainDrop.png");
  cubeImage = loadImage("sprites/cubeImage.png");
  play = loadImage("sprites/play.png");
  title = loadImage("sprites/title.png");
  
  //Animations
  Animation = new Animation();
  Animation.AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
  
  GameManager = new GameManager();
  
  textSize(12);
  }
}
