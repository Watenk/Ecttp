//Ecttp les 04
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

float displayWidth = 1920;
float displayHeight = 1080;

//Setup
Setup Setup;
boolean setupIsDone;

//Sound
import processing.sound.*;

public SoundFile backgroundMusic;
public SoundFile hit;

//Time
float frameCounterSmoothAmount = 20; //Sum of amount of frames
float frameMillis;
float previousFrameMillis;
float currentFrameRate;
float drawDeltaTime;
int frameCounter;
FloatList frameMillisList;
public float deltaTime;
public float smoothFrameRate = FPS;

//Wind
Wind Wind;
public float windChangeAmount = 1;
public float windChangeTime = 10;
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
public float cubePhysicsAmount = 500; // max 1000
public float cubePhysicsWeight = 10;
public ArrayList<CubePhysics> cubePhysicsList;

//Other
UI UI;
GameManager GameManager;
ScreenBorders ScreenBorders;
public Player1 Player1;
Enemy enemy1;

//Sprites
public PImage rainDrop;
public PImage cubeImage;

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
  text("Loading...", displayWidth / 2 - 200, displayHeight / 2);
}

//Update
void FixedUpdate(){
  
  background(175);
  
  Wind.Update();
  
  noStroke();
  RainManager.Update();
  stroke(1);
  
  CubePhysicsManager.Update();
  Player1.Update();
  enemy1.Update();
  
  ScreenBorders.Update();
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
      displayWidth = 1920;
      displayHeight = 1080;
    }
  
    if (mouseButton == RIGHT){
      displayWidth = 2560;
      displayHeight = 1440;
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
