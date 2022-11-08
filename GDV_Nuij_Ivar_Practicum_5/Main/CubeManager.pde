class CubeManager {

  public ArrayList<Cube> cubeList;

  CubeManager() {
  }

  void Update() {  
    for (int i=0; i < cubeList.size(); i += 1) {
      Cube currentCube = cubeList.get(i);

      currentCube.Update();
    }
  }

  void AddCubes(float _xPos, float _yPos, float _width, float _height, float _scale, float _weight, float _amount, float _maxSpeed) {
    for (int i=0; i < _amount; i += 1) {
      cubeList.add(new Cube(_xPos, _yPos, _width, _height, _scale, _weight, _maxSpeed));
    }
  }

  void AddCubesRandom(float _minXPos, float _maxXPos, float _minYPos, float _maxYPos, float _width, float _height, float _minScale, float _maxScale, float _weight, float _amount, float _maxSpeed) {
    for (int i=0; i < _amount; i += 1) {
      float _scale = random(_minScale, _maxScale);
      cubeList.add(new Cube(random(_minXPos, _maxXPos), random(_minYPos, _maxYPos), _width, _height, _scale, _weight, _maxSpeed));
    }
  }
  
  void Clear(){
    cubeList.clear();
  }
}
