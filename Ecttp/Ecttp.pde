//Ecttp les 01
//Ivar Nuij

//Classes
UI UI;

//Rain
float rainAmount = 1000;
float rainRespawnTimeAmount = 600;
float rainRespawnTime;
ArrayList<Rain> rainList;

Player player1;
Enemy enemy1;
CubePhysics cubePhysics1;

//--------------------------

void setup(){
  
  //Game Settings
  frameRate(60);
  fullScreen(P2D);
  background(255);
  noStroke();
  
  //Instance Classes
  UI = new UI();
  
  rainList = new ArrayList<Rain>();
  
  player1 = new Player();
  enemy1 = new Enemy();
  cubePhysics1 = new CubePhysics();
}

void draw(){
 
  clear();
  background(255);
  
  UI.update();
  
  RainList();
  player1.Update();
  enemy1.Update();
  cubePhysics1.update();
}

//-----------------------------

void RainList(){

    for(int i=0; i<= rainList.size() - 1; i += 1){
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
