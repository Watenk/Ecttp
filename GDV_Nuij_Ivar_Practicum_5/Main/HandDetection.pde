class HandDetection {

  PixelImage PixelImage;
  
  public int handPos;
  
  boolean started;
  int skinAmount[];

  void Start(PixelImage _PixelImage) {
    started = true;

    PixelImage = _PixelImage;

    skinAmount = new int[PixelImage.widthResolution + 100];
  }

  void Update() {
    if (started) {

      //Count pixels with skinColor
      for (int x=0; x < PixelImage.widthResolution; x += 1) {
        int amount = 0;
        for (int y=0; y < PixelImage.heightResolution; y += 1) {
          if (PixelImage.resizedPixelR[x][y] > 180 && PixelImage.resizedPixelR[x][y] < 230 && PixelImage.resizedPixelG[x][y] > 160 && PixelImage.resizedPixelG[x][y] < 200 & PixelImage.resizedPixelB[x][y] > 120 && PixelImage.resizedPixelB[x][y] < 170) {
            amount += 1;
          }
        }
        skinAmount[x] = amount;
      }
      //determine x row with most skinPixels
      int mostSkinPixels = 0;
      int mostSkinPixelsX = 0;
      for (int i=0; i < PixelImage.widthResolution; i += 1) {
        if (skinAmount[i] > mostSkinPixels) {
          mostSkinPixels = skinAmount[i];
          mostSkinPixelsX = i;
        }
      }
      handPos = int(map(mostSkinPixelsX, 0, PixelImage.widthResolution, displayWidth, 0));
    }
  }
}
