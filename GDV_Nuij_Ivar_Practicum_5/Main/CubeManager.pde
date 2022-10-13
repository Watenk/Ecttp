class CubeManager {

  float collisionSlowdown = 0.5;  //When 2 cubes hit how much they slow down 
  float collisionDetectRange = 50; //Cube detect range for other cubes (low values can cause collision inaccuracy)
  float cubeRepultion = 0;
  public ArrayList<Cube> cubeList;

  CubeManager() {
  }

  void Update() {  
    for (int i=0; i <= cubeList.size() - 1; i += 1) {
      Cube currentCube = cubeList.get(i);

      currentCube.CalcGravity();
      currentCube.Collision();
    }

    //CubeCollision
    for (int i=0; i <= cubeList.size() - 1; i += 1) {
      Cube cube1 = cubeList.get(i);

      for (int j=0; j <= cubeList.size() - 1; j += 1) {
        Cube cube2 = cubeList.get(j);

        if (dist(cube1.xPos, cube1.yPos, cube2.xPos, cube2.yPos) < collisionDetectRange && cube1 != cube2) { //Check if cubes are close to each other
          
          //Pos 3
          if (cube1.xPos3 >= cube2.xPos && cube1.yPos3 >= cube2.yPos && cube1.xPos3 <= cube2.xPos4 && cube1.yPos3 <= cube2.yPos4) { 
            
            if (cube1.ySpeed > 0.1 && cube2.ySpeed > 0.1) {  //cube1 & 2 speed going down
              cube1.ySpeed *= collisionSlowdown;
              cube1.yPos = cube2.yPos - cube2.cubeHeight - cubeRepultion;
            }
            else if (cube1.ySpeed < -0.1 && cube2.ySpeed < -0.1) {  //cube1 & 2 speed going up
              float averageSpeed = (cube1.ySpeed + cube2.ySpeed) / 2 * collisionSlowdown;
              cube1.ySpeed = averageSpeed;
              cube2.ySpeed = averageSpeed;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else if (cube1.ySpeed > 0.1 && cube2.ySpeed < -0.1) {  //cube1 going down - cube2 going up
              cube1.ySpeed *= collisionSlowdown * -1;
              cube2.ySpeed *= collisionSlowdown;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else if (cube1.ySpeed < -0.1 && cube2.ySpeed > 0.1) {  //cube1 going up - cube2 going down
              float averageSpeed = (cube1.ySpeed + cube2.ySpeed) / 2 * collisionSlowdown;
              cube1.ySpeed = averageSpeed;
              cube2.ySpeed = averageSpeed;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else {
              cube1.ySpeed *= collisionSlowdown;
              cube2.ySpeed *= collisionSlowdown;
              
              //if (cube1.ySpeed < 0.1) cube1.ySpeed = 0;
              //if (cube2.ySpeed < 0.1) cube2.ySpeed = 0;
              
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            }
          }

          //Pos 4
          if (cube1.xPos4 >= cube2.xPos && cube1.yPos4 >= cube2.yPos && cube1.xPos4 <= cube2.xPos4 && cube1.yPos4 <= cube2.yPos4) { 

            if (cube1.ySpeed > 0.1 && cube2.ySpeed > 0.1) {  //cube1 & 2 speed going down
              cube1.ySpeed *= collisionSlowdown;
              cube1.yPos = cube2.yPos - cube2.cubeHeight - cubeRepultion;
            }
            else if (cube1.ySpeed < -0.1 && cube2.ySpeed < -0.1) {  //cube1 & 2 speed going up
              float averageSpeed = (cube1.ySpeed + cube2.ySpeed) / 2 * collisionSlowdown;
              cube1.ySpeed = averageSpeed;
              cube2.ySpeed = averageSpeed;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else if (cube1.ySpeed > 0.1 && cube2.ySpeed < -0.1) {  //cube1 going down - cube2 going up
              cube1.ySpeed *= collisionSlowdown * -1;
              cube2.ySpeed *= collisionSlowdown;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else if (cube1.ySpeed < -0.1 && cube2.ySpeed > 0.1) {  //cube1 going up - cube2 going down
              float averageSpeed = (cube1.ySpeed + cube2.ySpeed) / 2 * collisionSlowdown;
              cube1.ySpeed = averageSpeed;
              cube2.ySpeed = averageSpeed;
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            } 
            else {
              cube1.ySpeed *= collisionSlowdown;
              cube2.ySpeed *= collisionSlowdown;
              
              //if (cube1.ySpeed < 0.1) cube1.ySpeed = 0;
              //if (cube2.ySpeed < 0.1) cube2.ySpeed = 0;
              
              cube1.yPos = cube2.yPos - cube1.cubeHeight - cubeRepultion;
            }
          }
        }
      }
    }
    
    currentSoundPlays = 0;
    
    for (int i=0; i <= cubeList.size() - 1; i += 1) {
      Cube currentCube = cubeList.get(i);

      currentCube.update();
    }

    //AddForce
    if (spacebar == true) {
      for (int i=0; i <= cubeList.size() - 1; i += 1) {
        Cube currentCube = cubeList.get(i);

        currentCube.AddForce();
      }
    }
  }

  void AddCubes(float _xPos, float _yPos, float _amount, float _cubeWeight) {
    for (int i=1; i <= _amount; i += 1) {
      cubeList.add(new Cube(_xPos, _yPos, _cubeWeight));
    }
  }

  void AddCubesRandom(float _minXPos, float _maxXPos, float _minYPos, float _maxYPos, float _amount) {
    for (int i=1; i <= _amount; i += 1) {
      cubeList.add(new Cube(random(_minXPos, _maxXPos), random(_minYPos, _maxYPos), 10));
    }
  }
  
  void Clear(){
    cubeList.clear();
  }
}
