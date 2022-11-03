class PlayerCollision{
  
  int collisionSize = 100 * displayWidth / 1920;
  
  void Update(){
    for(int i=0; i < CubeManager.cubeList.size(); i += 1){
      Shape currentCube = CubeManager.cubeList.get(i);
      
      if (dist(currentCube.xPos, currentCube.yPos, Player1.xPos + (Player1.Width / 2), Player1.yPos) < collisionSize){
        CubeManager.cubeList.remove(i);
      }
    }
  }
}
