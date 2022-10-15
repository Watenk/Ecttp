class PixelImage {

  PImage currentImage;
  int xPos;
  int yPos;
  int widthResolution;
  int heightResolution;
  float pixelSize;

  int[][] pixelList;
  int[][] resizedPixelList;

  color currentColor;

  int xDraw;
  int yDraw;

  PixelImage() {
  }

  void Add(PImage _currentImage, int _xPos, int _yPos, int _imageWidthResolution, int _imageHeightResolution, float _pixelSize) {
    currentImage = _currentImage;
    xPos = _xPos;
    yPos = _yPos;
    widthResolution = _imageWidthResolution;
    heightResolution = _imageHeightResolution;
    pixelSize = _pixelSize;

    //Convert Image to a grayScale array
    pixelList = new int[currentImage.width][currentImage.height];
    resizedPixelList = new int[widthResolution][heightResolution];

    currentImage.loadPixels();

    //make PixelList
    for (int x=0; x < currentImage.width; x += 1) {
      for (int y=0; y < currentImage.height; y += 1) {
        //currentColor = currentImage.get(x, y);
        currentColor = currentImage.pixels[y * currentImage.width + x];

        int grayScale;
        float red;
        float green;
        float blue;

        red = currentColor >> 16 & 0xFF;
        green = currentColor >> 8 & 0xFF;
        blue = currentColor & 0xFF;

        grayScale = int((red + green + blue) / 2);
        if (grayScale > 255) grayScale = 255;
        pixelList[x][y] = grayScale;
      }
    }

    int xResize = currentImage.width / widthResolution;
    int yResize = currentImage.height / heightResolution;

    //Resize pixelList
    for (int x=0; x < widthResolution; x += 1) {
      for (int y=0; y < heightResolution; y += 1) {

        resizedPixelList[x][y] = pixelList[x * xResize][y * yResize];
      }
    }
  }

  void Update() {
    //Draw PixelImage
    int x;
    int y;

    noStroke();
    for (y=0; y < heightResolution; y += 1) {
      for (x=0; x < widthResolution; x += 1) {
        fill(resizedPixelList[x][y], 255);
        rect(xDraw, yDraw, pixelSize, pixelSize);
        xDraw += pixelSize;
      }
      yDraw += pixelSize;
      xDraw = xPos;
    }
    xDraw = xPos;
    yDraw = yPos;
    stroke(1);
  }
}
