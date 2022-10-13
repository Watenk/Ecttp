class CubeManager {

  public ArrayList<Cube> cubeList;

  CubeManager() {
  }

  void Update() {  
    for (int i=0; i < cubeList.size(); i += 1) {
      Cube currentCube = cubeList.get(i);

      currentCube.Update();
    }

    //AddForce
    if (spacebar == true) {
      for (int i=0; i < cubeList.size(); i += 1) {
        Cube currentCube = cubeList.get(i);

        currentCube.AddForce();
      }
    }
  }

  void AddCubes(float _xPos, float _yPos, float _width, float _height, float _scale, float _weight, float _amount) {
    for (int i=0; i < _amount; i += 1) {
      cubeList.add(new Cube(_xPos, _yPos, _width, _height, _scale, _weight));
    }
  }

  void AddCubesRandom(float _minXPos, float _maxXPos, float _minYPos, float _maxYPos, float _width, float _height, float _scale, float _weight, float _amount) {
    for (int i=0; i < _amount; i += 1) {
      cubeList.add(new Cube(random(_minXPos, _maxXPos), random(_minYPos, _maxYPos), _width, _height, _scale, _weight));
    }
  }
  
  void Clear(){
    cubeList.clear();
  }
}
