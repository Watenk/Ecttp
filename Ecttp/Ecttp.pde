//Ecttp les 03
//Ivar Nuij

//Idea List--------
//Weather
//Time (day / night)
//Different sceen size compat
//2-player

//To Do
//Collision with player
//performance improvements (Rain, Collision, improve fixedUpdate())

//-----------------

//GameSettings
float FPS = 144; // lower than 60 causes slowdown
float updateSpeed = 60; //60 Times a second
float physicsUpdateSpeed = 1; // Higher is slower

//Time
float frameCounterSmoothAmount = 20; //Sum of amount of frames
float frameMillis;
float previousFrameMillis;
float currentFrameRate;
float drawDeltaTime;
int frameCounter;
FloatList frameMillisList;
public float deltaTime;
public float smoothFrameRate = 100;

//Wind
Wind Wind;
public float windChangeAmount = 1;
public float windChangeTime = 30;
public float rainWeight = 1;
public float windSpeedX;

//Rain
RainManager RainManager;
public float rainAmount = 500;
public float rainRespawnTimeAmount = 120;
ArrayList<Rain> rainList;
float rainRespawnTime;

//CubesPhysics
CubePhysicsManager CubePhysicsManager;
public float cubePhysicsAmount = 100; // max 1000
public float cubePhysicsWeight = 10;
public ArrayList<CubePhysics> cubePhysicsList;

//Other
UI UI;
GameManager GameManager;
public Player1 Player1;
Enemy enemy1;

//Sprites
public PImage rainDrop;

//Animation
public PImage[] rainSplash = new PImage[20];

//Input
public boolean spacebar;
public boolean w;
public boolean d;
public boolean s;
public boolean a;

//--------------------------

void setup(){
  
  frameRate(FPS);
  fullScreen(P2D);
  smooth(); // Anti-Ailiasing
  
  //Instance Classes
  CubePhysicsManager = new CubePhysicsManager();
  GameManager = new GameManager();
  Wind = new Wind();
  UI = new UI();
  RainManager = new RainManager();
  Player1 = new Player1();
  enemy1 = new Enemy();
  
  //Instance Arrays
  rainList = new ArrayList<Rain>();
  cubePhysicsList = new ArrayList<CubePhysics>();
  frameMillisList = new FloatList();
  
  //Sprites
  rainDrop = loadImage("sprites/rainDrop.png");
  
  //Animations
  AddAnimation(rainSplash, "animation/rainSplash/rainSplash", 20);
  
  CubePhysicsManager.AddCubes();
}

//Update
void FixedUpdate(){
  
  background(150);
  
  GameManager.Update();
  Wind.Update();
  
  noStroke();
  RainManager.Update();
  stroke(1);
  
  CubePhysicsManager.Update();
  Player1.Update();
  enemy1.Update();
}


void draw(){
  
  CalcFrameRate();
  CalcDeltaTime();
  
  //FixedUpdate
  drawDeltaTime += deltaTime;
  if (drawDeltaTime >= physicsUpdateSpeed){
    FixedUpdate();
    drawDeltaTime = 0;
  }
  
  UI.update();
}

//-----------------------------

//Inputs - Works only in a class with draw()
void keyPressed(){
  if (key == 'a'){
    a = true;
  }
    
  if (key == 'd'){
    d = true;
  }
      
  if (key == 'w'){
    w = true;
  }
      
  if (key == 's'){
    s = true;
  }
    
  if (key == ' '){
    spacebar = true; 
  }
    
    
  if (key == ESC){
    exit();
  }
}

void keyReleased(){
  if (key == 'a'){
    a = false;
  }
    
  if (key == 'd'){
    d = false;
  }
      
  if (key == 'w'){
    w = false;
  }
      
  if (key == 's'){
    s = false;
  }
    
  if (key == ' '){
    spacebar = false; 
  }
}

//Time
void CalcFrameRate(){
  //currentFrameRate
  frameMillis = millis() - previousFrameMillis;
  previousFrameMillis = millis();
  currentFrameRate = 1000 / frameMillis;
  
  //smoothFrameRate
  frameMillisList.set(frameCounter, frameMillis);
  if (frameCounter >= frameCounterSmoothAmount){    
    
    float frameTotal = frameMillisList.sum();
    smoothFrameRate = 1000 / (frameTotal / frameCounterSmoothAmount);
   
    frameMillisList.clear();
    frameCounter = 0;
  }
  frameCounter += 1;
}

void CalcDeltaTime(){
  deltaTime = updateSpeed / currentFrameRate;
}

void AddAnimation(PImage[] frames, String sprite, int frameAmount){
  for (int i=0; i < frameAmount; i += 1){
    String fileName = sprite + nf(i + 1, 4) + ".png";
    frames[i] = loadImage(fileName);
  }
}
