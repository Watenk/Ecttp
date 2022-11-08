class HandDetection {
  
  public int handPos;
  
  boolean started;
  int skinAmount[];

  void Start() {
    started = true;
    skinAmount = new int[GameManager.Camera.PixelImage.widthResolution+300];
  }

  void Update() {
    if (started) {

      //Count pixels with skinColor
      for (int x=0; x < GameManager.Camera.PixelImage.widthResolution; x += 1) {
        int amount = 0;
        for (int y=0; y < GameManager.Camera.PixelImage.heightResolution; y += 1) {
          if (GameManager.Camera.PixelImage.resizedPixelA[x][y] < 40){     //PixelImage.resizedPixelR[x][y] > 180 && PixelImage.resizedPixelR[x][y] < 230 && PixelImage.resizedPixelG[x][y] > 160 && PixelImage.resizedPixelG[x][y] < 200 & PixelImage.resizedPixelB[x][y] > 120 && PixelImage.resizedPixelB[x][y] < 170) {
            amount += 1;
          }
        }
        skinAmount[x] = amount;
        //println(skinAmount);
      }
      //determine x row with most skinPixels
      int mostSkinPixels = 0;
      int mostSkinPixelsX = 0;
      for (int i=0; i < GameManager.Camera.PixelImage.widthResolution; i += 1) {
        if (skinAmount[i] > mostSkinPixels) {
          mostSkinPixels = skinAmount[i];
          mostSkinPixelsX = i;
        }
      }
      handPos = int(map(mostSkinPixelsX, 0, GameManager.Camera.PixelImage.widthResolution, displayWidth, -300));
    }
  }
}
