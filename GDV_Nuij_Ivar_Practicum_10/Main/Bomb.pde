class Bomb extends Shape {

  boolean becomeBigger;
  boolean explode;
  boolean canBeDeleted;
  int animationDelay;

  int explosionCollisionSize = int(random(250, 350) * (displayWidth / 1920));

  Animation AnimationExplosion;

  Bomb(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _xSpeed, float _ySpeed, float _Scale, float _weight) {
    super(_xPos, _yPos, _cubeWidth, _cubeHeight, _Scale, _weight);
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;

    AnimationExplosion = new Animation();
  }

  void Update() {

    BiggerOrSmaller();
    WallCollision();
    if (explode) Explode();
    super.Update();
  }

  @Override
    void DrawShape() {
    if (!explode) image(bomb, xPos, yPos, 100, 100);
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

      if (dist(currentCube.xPos, currentCube.yPos, xPos, yPos) < explosionCollisionSize && AnimationExplosion.isDone == true) {
        GameManager.score += int(random(8, 12));
        CubeManager.cubeList.remove(i);
      }

      if (AnimationExplosion.isDone == false) {
        AnimationExplosion.Play(PixelImageExplosion, 34, int(xPos) - 50, int(yPos) - 50);
      } else {
        canBeDeleted = true;
      }
    }
  }
}
