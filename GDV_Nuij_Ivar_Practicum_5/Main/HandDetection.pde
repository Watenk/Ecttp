class HandDetection {

  boolean started;
  int handPos;

  void Start() {
    started = true;
  }

  void Update() {
    if (started) {

      int[][] x1Pixels = CalcPixels(0, 8);
      int[][] x2Pixels = CalcPixels(8, 16);
      int[][] x3Pixels = CalcPixels(16, 24);
      int[][] x4Pixels = CalcPixels(24, 32);
      int[][] x5Pixels = CalcPixels(32, 40);
      int[][] x6Pixels = CalcPixels(40, 48);
      int[][] x7Pixels = CalcPixels(48, 56);
      int[][] x8Pixels = CalcPixels(56, 64);
      int[][] x9Pixels = CalcPixels(64, 72);
      int[][] x10Pixels = CalcPixels(72, 80);
      
      int[] handAmount = new int[10];
      
      handAmount[0] = CalcAmountOfHandPixels(x1Pixels);
      handAmount[1] = CalcAmountOfHandPixels(x2Pixels);
      handAmount[2] = CalcAmountOfHandPixels(x3Pixels);
      handAmount[3] = CalcAmountOfHandPixels(x4Pixels);
      handAmount[4] = CalcAmountOfHandPixels(x5Pixels);
      handAmount[5] = CalcAmountOfHandPixels(x6Pixels);
      handAmount[6] = CalcAmountOfHandPixels(x7Pixels);
      handAmount[7] = CalcAmountOfHandPixels(x8Pixels);
      handAmount[8] = CalcAmountOfHandPixels(x9Pixels);
      handAmount[9] = CalcAmountOfHandPixels(x10Pixels);
      
      
      
    }
  }

  int[][] CalcPixels(int xMin, int xMax) {
    int[][] pixelArray;
    pixelArray = new int[xMax][PixelImage.heightResolution];

    for (int y=0; y < PixelImage.heightResolution; y += 1) {
      for (int x=xMin; x < xMax; x += 1) {
        pixelArray[x][y] = PixelImage.resizedPixelList[x][y];
      }
    }

    return pixelArray;
  }
  
  int CalcAmountOfHandPixels(int[][] pixelArray){
    int amount = 0;
    
    for (int y=0; y < PixelImage.heightResolution; y += 1){
      for (int x=0; x < 8; x += 1){
        if (pixelArray[x][y] > 120 && pixelArray[x][y]< 200){
          amount += 1;
        }
      }
    }
    
    return amount;
  }
}
