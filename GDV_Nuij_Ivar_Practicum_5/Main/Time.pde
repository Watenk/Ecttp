class Time {

  float frameCounterSmoothAmount = 20; //Sum of amount of frames
  float frameMillis;
  float previousFrameMillis;
  float currentFrameRate;
  float updateFixedUpdate;
  public int frameCounter;
  FloatList frameMillisList;
  public float deltaTime;
  public float smoothFrameRate = FPS;

  void CalcFrameRate() {
    //currentFrameRate
    frameMillis = millis() - previousFrameMillis;
    previousFrameMillis = millis();
    currentFrameRate = 1000 / frameMillis;

    //smoothFrameRate
    frameMillisList.set(frameCounter, frameMillis);
    if (frameCounter >= frameCounterSmoothAmount) {    

      float frameTotal = frameMillisList.sum();
      smoothFrameRate = 1000 / (frameTotal / frameCounterSmoothAmount);

      frameMillisList.clear();
      frameCounter = 0;
    }
    frameCounter += 1;
  }

  void CalcDeltaTime() {
    deltaTime = updateSpeed / currentFrameRate;
  }
}
