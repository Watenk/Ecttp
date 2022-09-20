class RainManager{
  
  Animation Animation;
  
  RainManager(){
    
    Animation = new Animation();
  }
  
  void Update(){
    for(int i=0; i <= rainList.size() - 1; i += 1){
      Rain currentRainDrop = rainList.get(i);
    
      currentRainDrop.Update();
      
      if(currentRainDrop.canBeDeleted == true){
        rainList.remove(i);
      }
    }
    
    rainRespawnTime -= 1;
    if (rainRespawnTime <= 0){
      Add();
      rainRespawnTime = rainRespawnTimeAmount;
    }
  }
  
  void Add() {
    for(int i=0; i<= rainAmount; i += 1){
      rainList.add(new Rain());
    }
  }
}
