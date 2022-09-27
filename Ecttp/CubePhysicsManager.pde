class CubePhysicsManager{
  
  float cubeRepultion = 0;
  
  CubePhysicsManager(){
  }
  
  void Update(){
   //Gravity   
   for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
      CubePhysics currentCube = cubePhysicsList.get(i);
    
      currentCube.CalcGravity();
    }
    
    //CubeCollision
    for (int i=0; i <= cubePhysicsList.size() - 1; i += 1){
      CubePhysics cube1 = cubePhysicsList.get(i);
 
      for (int j=0; j <= cubePhysicsList.size() - 1; j += 1){
        CubePhysics cube2 = cubePhysicsList.get(j);
        
        if (dist(cube1.xPos, cube1.yPos, cube2.xPos, cube2.yPos) < 50){ //Check if cubes are close to each other
          //Check if cube1 is inside cube2
          //Pos 1 - collision left side
          if (cube1.xPos > cube2.xPos && cube1.yPos > cube2.yPos - cube2.cubeHeight / 50 && cube1.xPos < cube2.xPos4 && cube1.yPos < cube2.yPos4){ 
            cube1.xSpeed = cube2.xSpeed * 0.9;
            cube1.xPos = cube2.xPos + cube1.cubeWidth + cubeRepultion;
          }
      
          //Pos 2 - collision right side
          if (cube1.xPos2 > cube2.xPos && cube1.yPos2 > cube2.yPos - cube2.cubeHeight / 50 && cube1.xPos2 < cube2.xPos4 && cube1.yPos2 < cube2.yPos4){
            cube1.xSpeed = cube2.xSpeed * 0.9;
            cube1.xPos = cube2.xPos - cube1.cubeWidth - cubeRepultion;
          }
        
          //Pos 3 - collision left bottom
          if (cube1.xPos3 > cube2.xPos && cube1.yPos3 > cube2.yPos && cube1.xPos3 < cube2.xPos4 && cube1.yPos3 < cube2.yPos4 - cube2.cubeHeight / 10){
            cube1.ySpeed = cube2.ySpeed * 0.9;
            cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
          }
        
          //Pos 4 - collision right bottom
          if (cube1.xPos4 > cube2.xPos && cube1.yPos4 > cube2.yPos && cube1.xPos4 < cube2.xPos4 && cube1.yPos4 < cube2.yPos4 - cube2.cubeHeight / 10){
            cube1.ySpeed = cube2.ySpeed * 0.9;
            cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
          }
        }
      }
    }
    
    //Update
    for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
      CubePhysics currentCube = cubePhysicsList.get(i);
    
      currentCube.update();
    }
    
    //AddForce
    if (spacebar == true){
      for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
        CubePhysics currentCube = cubePhysicsList.get(i);
      
        currentCube.AddForce();
      }
    }
  }

  void AddCubes(int _cubePhysicsAmount, float _cubeWeight) {
    for(int i=0; i <= _cubePhysicsAmount; i += 1){
      cubePhysicsList.add(new CubePhysics(random(0, displayWidth), random(0, 500), _cubeWeight));
    }
  } 
}
