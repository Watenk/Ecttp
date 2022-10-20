class Setup {
  //To get around the max 5000ms loadtime in processing

  Setup() {
    //Instance Classes
    Time = new Time();
    UI = new UI();
    Collision = new Collision();
    Camera = new Camera();
    PixelImage = new PixelImage();
    PixelVideo = new PixelVideo();
    HandDetection = new HandDetection();

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
    PixelImageRainSplash = new PixelImage();
    rainAtlas = loadImage("animation/rainSplash/rainAtlas.png");
    PixelImageRainSplash.Add(rainAtlas, 0, 0, 25, 500, 5, "RGB");

    //Sprites
    rainDrop = loadImage("sprites/rainDrop.png");
    cubeImage = loadImage("sprites/cubeImage.png");
    play = loadImage("sprites/play.png");
    title = loadImage("sprites/title.png");
    monaLisa = loadImage("sprites/monaLisa.png");
    
    //Sound
    backgroundMusic = new SoundFile(Main.this, "sound/backgroundMusic.wav");
    hit = new SoundFile(Main.this, "sound/hit.wav");

    GameManager = new GameManager();

    textSize(12);
  }
}
