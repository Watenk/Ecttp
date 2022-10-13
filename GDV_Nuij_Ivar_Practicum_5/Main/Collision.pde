class Collision {

  public ArrayList<Shape> collisionList;
  float collisionSlowdown = 0.5;  //When 2 cubes hit how much they slow down 
  float collisionDetectRange = 50; //Cube detect range for other cubes (low values can cause collision inaccuracy)
  float collisionRepultion = 0;

  Collision() {
    collisionList = new ArrayList<Shape>();
  }

  void Update() {

    //collisionList
    collisionList.clear();
    for (int i=0; i < CubeManager.cubeList.size(); i += 1) {
      collisionList.add(CubeManager.cubeList.get(i));
    }

    //Collision
    for (int i=0; i < collisionList.size(); i += 1) {
      Shape object1 = collisionList.get(i);

      for (int j=0; j < collisionList.size(); j += 1) {
        Shape object2 = collisionList.get(j);

        if (dist(object1.xPos, object1.yPos, object2.xPos, object2.yPos) < collisionDetectRange && object1 != object2) { //Check if cubes are close to each other

          //Pos 3
          if (object1.xPos3 >= object2.xPos && object1.yPos3 >= object2.yPos && object1.xPos3 <= object2.xPos4 && object1.yPos3 <= object2.yPos4) { 

            if (object1.ySpeed > 0.1 && object2.ySpeed > 0.1) {  //cube1 & 2 speed going down
              object1.ySpeed *= collisionSlowdown;
              object1.yPos = object2.yPos - object2.Height - collisionRepultion;
            } else if (object1.ySpeed < -0.1 && object2.ySpeed < -0.1) {  //cube1 & 2 speed going up
              float averageSpeed = (object1.ySpeed + object2.ySpeed) / 2 * collisionSlowdown;
              object1.ySpeed = averageSpeed;
              object2.ySpeed = averageSpeed;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else if (object1.ySpeed > 0.1 && object2.ySpeed < -0.1) {  //cube1 going down - cube2 going up
              object1.ySpeed *= collisionSlowdown * -1;
              object2.ySpeed *= collisionSlowdown;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else if (object1.ySpeed < -0.1 && object2.ySpeed > 0.1) {  //cube1 going up - cube2 going down
              float averageSpeed = (object1.ySpeed + object2.ySpeed) / 2 * collisionSlowdown;
              object1.ySpeed = averageSpeed;
              object2.ySpeed = averageSpeed;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else {
              object1.ySpeed *= collisionSlowdown;
              object2.ySpeed *= collisionSlowdown;

              //if (cube1.ySpeed < 0.1) cube1.ySpeed = 0;
              //if (cube2.ySpeed < 0.1) cube2.ySpeed = 0;

              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            }
          }

          //Pos 4
          if (object1.xPos4 >= object2.xPos && object1.yPos4 >= object2.yPos && object1.xPos4 <= object2.xPos4 && object1.yPos4 <= object2.yPos4) { 

            if (object1.ySpeed > 0.1 && object2.ySpeed > 0.1) {  //cube1 & 2 speed going down
              object1.ySpeed *= collisionSlowdown;
              object1.yPos = object2.yPos - object2.Height - collisionRepultion;
            } else if (object1.ySpeed < -0.1 && object2.ySpeed < -0.1) {  //cube1 & 2 speed going up
              float averageSpeed = (object1.ySpeed + object2.ySpeed) / 2 * collisionSlowdown;
              object1.ySpeed = averageSpeed;
              object2.ySpeed = averageSpeed;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else if (object1.ySpeed > 0.1 && object2.ySpeed < -0.1) {  //cube1 going down - cube2 going up
              object1.ySpeed *= collisionSlowdown * -1;
              object2.ySpeed *= collisionSlowdown;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else if (object1.ySpeed < -0.1 && object2.ySpeed > 0.1) {  //cube1 going up - cube2 going down
              float averageSpeed = (object1.ySpeed + object2.ySpeed) / 2 * collisionSlowdown;
              object1.ySpeed = averageSpeed;
              object2.ySpeed = averageSpeed;
              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            } else {
              object1.ySpeed *= collisionSlowdown;
              object2.ySpeed *= collisionSlowdown;

              //if (cube1.ySpeed < 0.1) cube1.ySpeed = 0;
              //if (cube2.ySpeed < 0.1) cube2.ySpeed = 0;

              object1.yPos = object2.yPos - object1.Height - collisionRepultion;
            }
          }
        }
      }
    }
    currentSoundPlays = 0;
  }
}
