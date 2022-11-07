//Ecttp les 09
//Ivar Nuij

//Idea List-------------------------------------
//Weather
//Time (day / night)
//Camera overlaps with cubes
//Custom cursor (cursor())

//To Do
//Gameplay =)
//performance improvements (Rain, fixedUpdate())

//-------------------------------------------------

//GameSettings
float FPS = 300; // lower than updateSpeed causes slowdown
float updateSpeed = 60; //60 Times a second

//Library's
import processing.sound.*;
import processing.video.*;

//Video's
Capture cam;
HandDetection HandDetection;
public Movie movie;

//Animations
public PixelImage PixelImageRainSplash;
public PImage rainAtlas;

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

//Setup
Setup Setup;
boolean setupIsDone;

//ScreenSize
int currentDisplayWidth;
int currentDisplayHeight;

//Input
public boolean spacebar;

//----------------------------------------------------

void setup() {
  //To Check the rest of Setup see Setup class

  frameRate(FPS);
  fullScreen(P2D); //JAVA2D (default) - P2D - P3D (openGL)
  smooth(); // Anti-Ailiasing

  textSize(50);
  text("Loading...", displayWidth / 2 * 0.9, displayHeight / 2);
}

void FixedUpdate() {

  background(175);
  
  GameManager.Update();
  
  Wind.Update();
  Collision.Update();

  RainManager.Update();
  CubeManager.Update();
  EnemyManager.Update();
  
  HandDetection.Update();

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

  UI.update();
}

//-----------------------------------------------

//Inputs - Only works in a class with draw()
void keyPressed() {
  if (key == ' ') {
    spacebar = true;
  }

  if (key == ESC) {
    exit();
  }
}

void keyReleased() {
  if (key == ' ') {
    spacebar = false;
  }
}

void mousePressed() {
  if (GameManager.currentScene == "Lvl01") {
    if (mouseButton == LEFT) {
      GameManager.score += 500;
    }
  }
}
