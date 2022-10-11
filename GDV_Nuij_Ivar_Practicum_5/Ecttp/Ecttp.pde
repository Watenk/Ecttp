//Ecttp les 06
//Ivar Nuij

//Idea List--------
//Weather
//Time (day / night)
//2-player
//Custom cursor (cursor())
//Main Menu - WIP

//To Do
//Collision with player
//Collision with wall - WIP
//performance improvements (Rain, improve fixedUpdate())

//-----------------

//GameSettings
float FPS = 300; // lower than updateSpeed causes slowdown
float updateSpeed = 60; //60 Times a second

//Setup
Setup Setup;
boolean setupIsDone;

//ScreenSize
int currentDisplayWidth;
int currentDisplayHeight;

//Sound
import processing.sound.*;

public float maxSoundPlays = 1; //max sounds each frame
public float currentSoundPlays;

public SoundFile backgroundMusic;
public SoundFile hit;

//Time
float frameCounterSmoothAmount = 20; //Sum of amount of frames
float frameMillis;
float previousFrameMillis;
float currentFrameRate;
float drawDeltaTime;
public int frameCounter;
FloatList frameMillisList;
public float deltaTime;
public float smoothFrameRate = FPS;

//Wind
Wind Wind;
public float windChangeAmount = 0; //Amount of pixels wind changes every windChangeTime
public float windChangeTime = 5;   //Amount of frames wind changes
public float rainWeight = 1;
public float windSpeedX;

//Rain
RainManager RainManager;
public float rainAmount = 0;
public float rainRespawnTimeAmount = 120;
ArrayList<Rain> rainList;
float rainRespawnTime;

//CubesPhysics
CubePhysicsManager CubePhysicsManager;
public ArrayList<CubePhysics> cubePhysicsList;

//Other
UI UI;
GameManager GameManager;
Enemy enemy1;
public Player1 Player1;

//Sprites
public PImage rainDrop;
public PImage cubeImage;
public PImage play;
public PImage title;

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
  //To Check the rest of Setup see Setup class
  
  frameRate(FPS);
  fullScreen(P2D);
  smooth(); // Anti-Ailiasing
  
  textSize(50);
  text("Loading...", displayWidth / 2 - 125, displayHeight / 2);
}

//Update
void FixedUpdate(){
  
  background(175);
  
  Wind.Update();
  
  noStroke();
  RainManager.Update();
  stroke(1);
  
  CubePhysicsManager.Update();
  
  enemy1.Update();
  
  currentSoundPlays = 0;
}


void draw(){
  
  if (setupIsDone == false){
    Setup = new Setup();
    setupIsDone = true;
  }
  
  CalcFrameRate();
  CalcDeltaTime();
  
  //FixedUpdate
  drawDeltaTime += deltaTime;
  if (drawDeltaTime >= 1){
    FixedUpdate();
    drawDeltaTime = 0;
  }
  
  GameManager.Update();
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

void mousePressed(){
  if (GameManager.currentScene == "MainMenu"){
    if (mouseButton == LEFT){

    }
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