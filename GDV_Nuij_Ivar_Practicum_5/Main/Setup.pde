class Setup{
  //To get around the max 5000ms loadtime in processing
  
  Setup(){
  
  println("Setup");
    
  //Instance Classes
  Time = new Time();
  UI = new UI();
  Collision = new Collision();
  
  CubeManager = new CubeManager();
  EnemyManager = new EnemyManager();
  RainManager = new RainManager();
  
  Wind = new Wind();
  
  println("Arrays");
  
  //Instance Arrays
  Time.frameMillisList = new FloatList();
  
  CubeManager.cubeList = new ArrayList<Cube>();
  EnemyManager.enemyList = new ArrayList<Enemy>();
  RainManager.rainList = new ArrayList<Rain>();
  
  println("Sound");
  
  //Sound
  backgroundMusic = new SoundFile(Main.this, "sound/backgroundMusic.mp3");
  hit = new SoundFile(Main.this, "sound/hit.wav");
  
  println("Sprites");
  
  //Sprites
  rainDrop = loadImage("sprites/rainDrop.png");
  cubeImage = loadImage("sprites/cubeImage.png");
  play = loadImage("sprites/play.png");
  title = loadImage("sprites/title.png");
  
  println("Animations");
  
  //Animations
  Animation = new Animation();
  
  Animation.AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
  Animation.PreloadAnimation(rainSplash, 20);
  
  println("GameManager");
  
  GameManager = new GameManager();
  
  textSize(12);
  }
}
