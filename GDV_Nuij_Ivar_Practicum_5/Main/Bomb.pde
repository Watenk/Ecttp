class Bomb extends Shape {

  boolean becomeBigger;
  
  int explosionCollisionSize = 500;

  Bomb(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _xSpeed, float _ySpeed, float _Scale, float _weight) {
    super(_xPos, _yPos, _cubeWidth, _cubeHeight, _Scale, _weight);
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }

  void Update() {

    BiggerOrSmaller();
    WallCollision();
    Explode();
    super.Update();
  }

  void BiggerOrSmaller() {
    if (Scale >= 1.1) {
      becomeBigger = false;
    }

    if (Scale <= 0.5) {
      becomeBigger = true;
    }

    if (becomeBigger == true) {
      Scale += 0.01;
    } else {
      Scale -= 0.01;
    }
  }

  void WallCollision() {
    if (xPos2 >= displayWidth || xPos <= 0) {
      xSpeed *= -1;
    }
  }

  void Explode() {
    for (int i=0; i < CubeManager.cubeList.size(); i += 1) {
      Shape currentCube = CubeManager.cubeList.get(i);

      if (dist(currentCube.xPos, currentCube.yPos, xPos, yPos) < explosionCollisionSize) {
        CubeManager.cubeList.remove(i);
        GameManager.score += int(random(8, 12));
      }
    }
  }
}
