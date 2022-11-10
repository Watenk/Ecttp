class Setup {
  //To get around the max 5000ms loadtime in processing

  Setup() {
    //Instance Classes
    Time = new Time();
    UI = new UI();
    Collision = new Collision();
    HandDetection = new HandDetection();

    CubeManager = new CubeManager();
    BombManager = new BombManager();
    RainManager = new RainManager();

    Wind = new Wind();

    //Instance Arrays
    Time.frameMillisList = new FloatList();

    CubeManager.cubeList = new ArrayList<Cube>();
    BombManager.bombList = new ArrayList<Bomb>();
    RainManager.rainList = new ArrayList<Rain>();

    //Animations
    PixelImageRainSplash = new PixelImage();
    rainAtlas = loadImage("animation/rainAtlas.png");
    PixelImageRainSplash.Add(rainAtlas, 0, 0, 25, 500, 5, "RGB");
    
    PixelImageExplosion = new PixelImage();
    explosionAtlas = loadImage("animation/explosionAtlas.png");
    PixelImageExplosion.Add(explosionAtlas, 0, 0, 32, 816, 7, "RGB");

    //Sprites
    rainDrop = loadImage("sprites/rainDrop.png");
    cubeImage = loadImage("sprites/cubeImage.png");
    play = loadImage("sprites/play.png");
    title = loadImage("sprites/title.png");
    monaLisa = loadImage("sprites/monaLisa.png");
    bomb = loadImage("sprites/bomb.png");
    
    //Sound
    backgroundMusic = new SoundFile(Main.this, "sound/backgroundMusic.mp3");
    hit = new SoundFile(Main.this, "sound/hit.wav");
    boom = new SoundFile(Main.this, "sound/boom.wav");

    GameManager = new GameManager();

    textSize(12);
  }
}
