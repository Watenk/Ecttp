class RainManager {

  public float rainAmount = 0;
  public float rainRespawnTimeAmount = 120;
  public float rainWeight = 1;
  ArrayList<Rain> rainList;
  float rainRespawnTime;
  Animation Animation1;
  int timer;

  RainManager() {

    Animation1 = new Animation();
  }

  void Update() {

    if (Animation1.isDone == false) {
      Animation1.Play(rainSplash, 20, 0, 0, 1, 1);
    }

    for (int i=0; i <= rainList.size() - 1; i += 1) {
      Rain currentRainDrop = rainList.get(i);

      currentRainDrop.Update();

      if (currentRainDrop.canBeDeleted == true) {
        rainList.remove(i);
      }
    }

    rainRespawnTime -= 1;
    if (rainRespawnTime <= 0) {
      Add();
      rainRespawnTime = rainRespawnTimeAmount;
    }
  }

  void Add() {
    for (int i=0; i<= rainAmount; i += 1) {
      rainList.add(new Rain());
    }
  }
}
