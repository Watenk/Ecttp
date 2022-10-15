//Ecttp les 07
//Ivar Nuij

//Idea List-------------------------------------
//Weather
//Time (day / night)
//2-player
//Custom cursor (cursor())

//To Do
//Collision with player - WIP
//CubeCollision with wall - ??
//performance improvements (Rain, fixedUpdate(), loadtimes!, color functions (red(), etc), PImage.get())

//-------------------------------------------------

//GameSettings
float FPS = 300; // lower than updateSpeed causes slowdown
float updateSpeed = 60; //60 Times a second

//Library's
import processing.sound.*;
import processing.video.*;

//Video's
PixelVideo PixelVideo;
public Movie movie;
public PImage currentMovieFrame;

//Animations
PImage[] rainSplash = new PImage[20];

//Sprites
public PImage rainDrop;
public PImage cubeImage;
public PImage play;
public PImage title;
public PImage monaLisa;

//Sounds
public float maxSoundPlays = 1; //max sounds each frame
public float currentSoundPlays;

public SoundFile backgroundMusic;
public SoundFile hit;

//Other
Time Time;
UI UI;
GameManager GameManager;

Shape Shape;
Cube Cube;
CubeManager CubeManager;
Collision Collision;
Enemy Enemy;
EnemyManager EnemyManager;
Player1 Player1;

Wind Wind;
RainManager RainManager;

Animation Animation;
PixelImage PixelImage;

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
  fullScreen(P2D); //JAVA2D (default) - P2D - P3D (openGL)
  smooth(); // Anti-Ailiasing

  textSize(50);
  text("Loading... - can take up to a minute :/", displayWidth / 4, displayHeight / 2);
}

void FixedUpdate() {

  background(175);

  Wind.Update();
  Collision.Update();
  noStroke();
  RainManager.Update();
  stroke(1);
  CubeManager.Update();
  EnemyManager.Update();
  PixelVideo.Update();
  PixelImage.Update();

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

//Inputs - Only works in a class with draw()
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
