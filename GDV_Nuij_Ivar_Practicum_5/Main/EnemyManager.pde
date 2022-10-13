class EnemyManager{
  
  public ArrayList<Enemy> enemyList;
  
  EnemyManager(){}
  
  void Update(){

    for (int i=0; i < enemyList.size(); i += 1){
      Enemy currentEnemy = enemyList.get(i);
      currentEnemy.Update();
    }
  }
  
  void AddEnemy(float _xPos, float _yPos, float _cubeWidth, float _cubeHeight, float _xSpeed, float _ySpeed, float _Scale, float _weight, float _amount){
    for (int i=0; i < _amount; i += 1) {
      enemyList.add(new Enemy(_xPos, _yPos, _cubeWidth, _cubeHeight, _xSpeed, _ySpeed, _Scale, _weight));
    }
  }
}
