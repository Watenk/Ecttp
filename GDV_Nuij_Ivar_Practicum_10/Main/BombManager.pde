class BombManager {

  public ArrayList<Bomb> bombList;

  BombManager() {
  }

  void Update() {
    
    ExplodeAll();

    for (int i=0; i < bombList.size(); i += 1) {
      Bomb currentBomb = bombList.get(i);
      
      if (currentBomb.canBeDeleted == true) bombList.remove(i);
      
      currentBomb.Update();
    }
  }

  void AddBomb(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _xSpeed, float _ySpeed, float _Scale, float _weight, float _amount) {
    for (int i=0; i < _amount; i += 1) {
      bombList.add(new Bomb(_xPos, _yPos, _cubeWidth, _cubeHeight, _xSpeed, _ySpeed, _Scale, _weight));
    }
  }

  void AddRandomBomb(float _xPosMin, float _xPosMax, float _yPosMin, float _yPosMax, float _cubeWidth, float _cubeHeight, float _xSpeedMin, float _xSpeedMax, float _ySpeedMin, float _ySpeedMax, float _Scale, float _weight, float _amount) {
    for (int i=0; i < _amount; i += 1) {
      float _xPos = random(_xPosMin, _xPosMax);
      float _yPos = random(_yPosMin, _yPosMax);
      float _xSpeed = random(_xSpeedMin, _xSpeedMax);
      float _ySpeed = random(_ySpeedMin, _ySpeedMax);
      bombList.add(new Bomb(_xPos, _yPos, _cubeWidth, _cubeHeight, _xSpeed, _ySpeed, _Scale, _weight));
    }
  }

  void ExplodeAll() {
    if (spacebar == true) {
      for (int i=0; i < bombList.size(); i += 1) {
        Bomb currentBomb = bombList.get(i);
        currentBomb.explode = true;
      }
    }
  }
}
