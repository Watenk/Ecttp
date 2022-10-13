class Enemy extends Shape {

  boolean becomeBigger;

  Enemy(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _xSpeed, float _ySpeed, float _Scale, float _weight) {
    super(_xPos, _yPos, _cubeWidth, _cubeHeight, _Scale, _weight);
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }

  void Update() {

    BiggerOrSmaller();
    WallCollision();
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
      Scale += 0.005;
    } else {
      Scale -= 0.005;
    }
  }

  void WallCollision() {
    if (xPos2 >= displayWidth || xPos <= 0) {
      xSpeed *= -1;
    }
  }
}
