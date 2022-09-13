//Ecttp les 01
//Ivar Nuij

//Classes
//Rain
float rainAmount = 1000;
float rainRespawnTimeAmount = 600;
float rainRespawnTime;
ArrayList<Rain> rainList;

Player player1;

Enemy enemy1;

//--------------------------

void setup(){
  
  //Game Settings
  frameRate(60);
  fullScreen(P2D);
  background(255);
  noStroke();
  
  rainList = new ArrayList<Rain>();
  player1 = new Player();
  enemy1 = new Enemy();
}

void draw(){
 
  clear();
  background(255);
  
  Rain();
  player1.Update();
  enemy1.Update();
}

//-----------------------------

void Rain(){

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
