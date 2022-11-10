class Wind {

  public float windChangeAmount = 0; //Amount of pixels wind changes every windChangeTime
  public float windChangeTime = 5;   //Amount of frames wind changes
  public float windSpeedX;
  float maxSpeed = 5;
  float windTimer;

  Wind() {
  }

  void Update() {
    windTimer += 1;

    if (windTimer >= windChangeTime) {
      ChangeWindDirection();
      windTimer = 0;
    }
  }

  void ChangeWindDirection() {
    if (windSpeedX >= maxSpeed) {
      windSpeedX -= windChangeAmount;
    }

    if (windSpeedX <= -maxSpeed) {
      windSpeedX += windChangeAmount;
    }

    if (windSpeedX <= maxSpeed && windSpeedX >= -maxSpeed) {
      windSpeedX = random(windSpeedX - windChangeAmount, windSpeedX + windChangeAmount);
    }
  }
}
