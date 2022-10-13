//Ecttp les 06
//Ivar Nuij

//Idea List-------------------------------------
//Weather
//Time (day / night)
//2-player
//Custom cursor (cursor())

//To Do
//Collision with player - WIP
//CubeCollision with wall - ??
//performance improvements (Rain, improve fixedUpdate())

//-------------------------------------------------

//GameSettings
float FPS = 300; // lower than updateSpeed causes slowdown
float updateSpeed = 60; //60 Times a second

//Sprites
public PImage rainDrop;
public PImage cubeImage;
public PImage play;
public PImage title;

//Animation
public PImage[] rainSplash = new PImage[20];

//Sound
import processing.sound.*;

public float maxSoundPlays = 1; //max sounds each frame
public float currentSoundPlays;

public SoundFile backgroundMusic;
public SoundFile hit;

//Other
Wind Wind;
RainManager RainManager;
CubeManager CubeManager;
Time Time;
Animation Animation;
Collision Collision;
UI UI;
GameManager GameManager;

Enemy enemy1;
public Player1 Player1;

//Setup
Setup Setup;
boolean setupIsDone;

//ScreenSize
int currentDisplayWidth;
int currentDisplayHeight;

//Input
public boolean spacebar;
public boolean w;
public boolean d;
public boolean s;
public boolean a;

//----------------------------------------------------

void setup() {
  //To Check the rest of Setup see Setup class

  frameRate(FPS);
  fullScreen(P2D);
  smooth(); // Anti-Ailiasing

  textSize(50);
  text("Loading...", displayWidth / 2 - 125, displayHeight / 2);
}

void FixedUpdate() {

  background(175);
  
  Wind.Update();
  Collision.Update();
  CubeManager.Update();
  enemy1.Update();
  noStroke(); RainManager.Update(); stroke(1);

  currentSoundPlays = 0;
}

//------------------------------------------------------

void draw() {

  if (setupIsDone == false) {
    Setup = new Setup();
    setupIsDone = true;
  }

  Time.CalcFrameRate();
  Time.CalcDeltaTime();

  //FixedUpdate
  Time.updateFixedUpdate += Time.deltaTime;
  if (Time.updateFixedUpdate >= 1) {
    FixedUpdate();
    Time.updateFixedUpdate = 0;
  }

  GameManager.Update();
  UI.update();
}

//-----------------------------------------------

//Inputs - Works only in a class with draw()
void keyPressed() {
  if (key == 'a') {
    a = true;
  }

  if (key == 'd') {
    d = true;
  }

  if (key == 'w') {
    w = true;
  }

  if (key == 's') {
    s = true;
  }

  if (key == ' ') {
    spacebar = true;
  }


  if (key == ESC) {
    exit();
  }
}

void keyReleased() {
  if (key == 'a') {
    a = false;
  }

  if (key == 'd') {
    d = false;
  }

  if (key == 'w') {
    w = false;
  }

  if (key == 's') {
    s = false;
  }

  if (key == ' ') {
    spacebar = false;
  }
}

void mousePressed() {
  if (GameManager.currentScene == "MainMenu") {
    if (mouseButton == LEFT) {
    }
  }
}
