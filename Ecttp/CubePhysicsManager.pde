class CubePhysicsManager{
  
  float cubeRepultion = 0;
  
  CubePhysicsManager(){
  }
  
  void update(){
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
        
        if (cube1 == cube2){
          j += 1;
        }
        
        //Pos 1
        if (cube1.xPos > cube2.xPos && cube1.yPos > cube2.yPos){
          if (cube1.xPos < cube2.xPos4 && cube1.yPos < cube2.yPos4){
            
          }
        }
      
        //Pos 2
        if (cube1.xPos2 > cube2.xPos && cube1.yPos2 > cube2.yPos){
          if (cube1.xPos2 < cube2.xPos4 && cube1.yPos2 < cube2.yPos4){
            
          }
        }
      
        //Pos 3
        if (cube1.xPos3 > cube2.xPos && cube1.yPos3 > cube2.yPos){
          if (cube1.xPos3 < cube2.xPos4 && cube1.yPos3 < cube2.yPos4){
            cube1.ySpeed = cube2.ySpeed * 0.9;
            cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
          }
        }
      
        //Pos 4
        if (cube1.xPos4 > cube2.xPos && cube1.yPos4 > cube2.yPos){
          if (cube1.xPos4 < cube2.xPos4 && cube1.yPos4 < cube2.yPos4){
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
    
    if (spacebar == true){
      for(int i=0; i <= cubePhysicsList.size() - 1; i += 1){
        CubePhysics currentCube = cubePhysicsList.get(i);
      
        currentCube.AddForce();
      }
    }
  }

  void AddCubes() {
    for(int i=0; i <= cubePhysicsAmount; i += 1){
      cubePhysicsList.add(new CubePhysics(random(0, displayWidth), random(-1000, 0)));
    }
  } 
}
