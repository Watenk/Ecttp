class Setup {
  //To get around the max 5000ms loadtime in processing

  Setup() {
    //Instance Classes
    Time = new Time();
    UI = new UI();
    Collision = new Collision();
    PixelImage = new PixelImage();
    Video = new Video();

    CubeManager = new CubeManager();
    EnemyManager = new EnemyManager();
    RainManager = new RainManager();

    Wind = new Wind();

    //Instance Arrays
    Time.frameMillisList = new FloatList();

    CubeManager.cubeList = new ArrayList<Cube>();
    EnemyManager.enemyList = new ArrayList<Enemy>();
    RainManager.rainList = new ArrayList<Rain>();

    //Animations
    Animation = new Animation();

    Animation.AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
    Animation.PreloadAnimation(rainSplash, 20);

    //Sprites
    rainDrop = loadImage("sprites/rainDrop.png");
    cubeImage = loadImage("sprites/cubeImage.png");
    play = loadImage("sprites/play.png");
    title = loadImage("sprites/title.png");
    monaLisa = loadImage("sprites/monaLisa.png");
    
    //Sound
    backgroundMusic = new SoundFile(Main.this, "sound/backgroundMusic.mp3");
    hit = new SoundFile(Main.this, "sound/hit.wav");

    GameManager = new GameManager();

    textSize(12);
  }
}
