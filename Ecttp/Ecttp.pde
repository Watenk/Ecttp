//Ecttp les 03
//Ivar Nuij

float FPS = 1000; // lower than 60 causes slowdown
float updateSpeed = 60; //60 Times a second
float physicsUpdateSpeed = 1; // Higher is slower

//Time
float frameCounterSmoothAmount = 20; 
float frameMillis;
float previousFrameMillis;
float currentFrameRate;
float drawDeltaTime;
int frameCounter;
FloatList frameMillisList;
public float deltaTime;
public float smoothFrameRate;

//Classes
//Rain
ArrayList<Rain> rainList;
float rainAmount = 1000;
float rainRespawnTimeAmount = 600;
float rainRespawnTime;

//CubesPhysics
ArrayList<CubePhysics> cubePhysicsList;
float cubePhysicsAmount = 10;

UI UI;
public Player player1;
Enemy enemy1;

//--------------------------

void setup(){
  
  //Game Settings
  frameRate(FPS);
  fullScreen(P2D);
  background(255);
  smooth();
  
  //Instance Classes
  UI = new UI();
  
  frameMillisList = new FloatList();
  
  rainList = new ArrayList<Rain>();
  cubePhysicsList = new ArrayList<CubePhysics>();
  
  player1 = new Player();
  enemy1 = new Enemy();
  
  AddCubePhysics();
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
  UI.draw();
}

void FixedUpdate(){
  
  background(150);
  
  noStroke();
  RainUpdate();
  stroke(1);
  
  CubePhysicsUpdate();
  player1.Update();
  enemy1.Update();
}

//-----------------------------

void CalcFrameRate(){
  //currentFrameRate
  frameMillis = millis() - previousFrameMillis;
  previousFrameMillis = millis();
  currentFrameRate = 1000 / frameMillis;
  
  //smoothFrameRate
  frameMillisList.set(frameCounter, frameMillis);
  if (frameCounter == frameCounterSmoothAmount){    
    
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

void RainUpdate(){
    for(int i=0; i <= rainList.size() - 1; i += 1){
    Rain currentRainDrop = rainList.get(i);
    
    currentRainDrop.Update();
    
    if(currentRainDrop.canBeDeleted == true){
      rainList.remove(i);
    }
  }
  
  rainRespawnTime -= 1;
  if (rainRespawnTime <= 0){
    AddRain();
    rainRespawnTime = rainRespawnTimeAmount;
  }
}

void AddRain() {

  for(int i=0; i<= rainAmount; i += 1){
    rainList.add(new Rain());
  }
}

void CubePhysicsUpdate(){
  for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
    CubePhysics currentCube = cubePhysicsList.get(i);
    
    currentCube.update();
  }
  
  if (UI.spacebar == true){
    for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
      CubePhysics currentCube = cubePhysicsList.get(i);
      
      currentCube.AddForce();
    }
  }
}

void AddCubePhysics() {

  for(int i=0; i <= cubePhysicsAmount; i += 1){
    cubePhysicsList.add(new CubePhysics(random(0, displayWidth), random(-5000, 0)));
  }
}
