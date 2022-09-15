//Ecttp les 02
//Ivar Nuij

//Classes
UI UI;

//Rain
ArrayList<Rain> rainList;
float rainAmount = 1000;
float rainRespawnTimeAmount = 600;
float rainRespawnTime;

//CubesPhysics
ArrayList<CubePhysics> cubePhysicsList;
float cubePhysicsAmount = 10;

Player player1;
Enemy enemy1;

//--------------------------

void setup(){
  
  //Game Settings
  frameRate(60);
  fullScreen(P2D);
  background(255);
  smooth();
  
  //Instance Classes
  UI = new UI();
  
  rainList = new ArrayList<Rain>();
  cubePhysicsList = new ArrayList<CubePhysics>();
  
  player1 = new Player();
  enemy1 = new Enemy();
  
  AddCubePhysics();
}

void draw(){
 
  background(255);
  
  UI.update();
  
  noStroke();
  RainUpdate();
  stroke(1);
  CubePhysicsUpdate();
  player1.Update();
  enemy1.Update();
}

//-----------------------------

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
}

void AddCubePhysics() {

  for(int i=0; i <= cubePhysicsAmount; i += 1){
    cubePhysicsList.add(new CubePhysics(random(0, displayWidth), random(-5000, 0)));
  }
}
