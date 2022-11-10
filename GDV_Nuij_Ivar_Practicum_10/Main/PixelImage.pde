class PixelImage {

  PImage currentImage;

  String mode;

  int xPos;
  int yPos;
  float pixelSize;
  public int widthResolution;
  public int heightResolution;

  int[][] pixelR;
  int[][] pixelG;
  int[][] pixelB;
  int[][] pixelA;
  int[][] pixelColor;

  int[][] resizedPixelR;
  int[][] resizedPixelG;
  int[][] resizedPixelB;
  int[][] resizedPixelA;
  int[][] resizedPixelColor;

  String[] characters = {" ", " ", " ", ".", "`", "-", "^", "v", "2", "3", "5", "=", "%", "c", "l", "x", "#", "w", "F", "A", "&", "8", "U", "$", "@", "ñ", "■", "■", "■", "■"};

  color currentColor;

  int xDraw;
  int yDraw;

  void Add(PImage _currentImage, int _xPos, int _yPos, int _imageWidthResolution, int _imageHeightResolution, float _pixelSize, String _mode) {
    mode = _mode;
    currentImage = _currentImage;
    xPos = _xPos;
    yPos = _yPos;
    widthResolution = _imageWidthResolution;
    heightResolution = _imageHeightResolution;
    pixelSize = _pixelSize;

    pixelR = new int[currentImage.width][currentImage.height];
    pixelG = new int[currentImage.width][currentImage.height];
    pixelB = new int[currentImage.width][currentImage.height];
    pixelA = new int[currentImage.width][currentImage.height];
    pixelColor = new int[currentImage.width][currentImage.height];

    resizedPixelR = new int[widthResolution][heightResolution];
    resizedPixelG = new int[widthResolution][heightResolution];
    resizedPixelB = new int[widthResolution][heightResolution];
    resizedPixelA = new int[widthResolution][heightResolution];
    resizedPixelColor = new int[widthResolution][heightResolution];

    currentImage.loadPixels();

    //make PixelList
    for (int x=0; x < currentImage.width; x += 1) {
      for (int y=0; y < currentImage.height; y += 1) {
        currentColor = currentImage.pixels[y * currentImage.width + x];

        float red;
        float green;
        float blue;
        float alpha;

        red = currentColor >> 16 & 0xFF;
        green = currentColor >> 8 & 0xFF;
        blue = currentColor & 0xFF;
        alpha = (red + green + blue) / 3;

        pixelR[x][y] = int(red);
        pixelG[x][y] = int(green);
        pixelB[x][y] = int(blue);
        pixelA[x][y] = int(alpha);
        pixelColor[x][y] = currentColor;
      }
    }

    int xResize = currentImage.width / widthResolution;
    int yResize = currentImage.height / heightResolution;

    //Resize pixelList
    for (int y=0; y < heightResolution; y += 1) {
      for (int x=0; x < widthResolution; x += 1) {

        resizedPixelR[x][y] = pixelR[x * xResize][y * yResize];
        resizedPixelG[x][y] = pixelG[x * xResize][y * yResize];
        resizedPixelB[x][y] = pixelB[x * xResize][y * yResize];
        resizedPixelA[x][y] = pixelA[x * xResize][y * yResize];
        resizedPixelColor[x][y] = pixelColor[x * xResize][y * yResize];
      }
    }
  }

  void Draw() {
    //Draw PixelImage

    noStroke();
    for (int y=0; y < heightResolution; y += 1) {
      for (int x=0; x < widthResolution; x += 1) {
        
        //Different drawModes
        if (mode == "RGB") {
          fill(color(resizedPixelR[x][y], resizedPixelG[x][y], resizedPixelB[x][y]));
          rect(xDraw, yDraw, pixelSize, pixelSize);
        } else if (mode == "GrayScale") {
          fill(resizedPixelA[x][y]);
          rect(xDraw, yDraw, pixelSize, pixelSize);
        } else if (mode == "Characters") {
          fill(0);
          textSize(pixelSize);
          int intDarkness = int(map(resizedPixelA[x][y], 1, 255, characters.length - 1, 0));
          text(characters[intDarkness], xDraw, yDraw);
        } else if (mode == "OldTV") {
          fill(resizedPixelA[x][y] + int(random(-50, 50)));
          rect(xDraw, yDraw, pixelSize, pixelSize);
        } else if (mode == "OldColorTV") {
          fill(resizedPixelR[x][y] + int(random(-50, 50)), resizedPixelG[x][y] + int(random(-50, 50)), resizedPixelB[x][y] + int(random(-50, 50)));
          rect(xDraw, yDraw, pixelSize, pixelSize);
        } else if (mode == "BlackOrWhite") {
          if (resizedPixelA[x][y] > 127) fill(255);
          if (resizedPixelA[x][y] <= 127) fill(0);
          rect(xDraw, yDraw, pixelSize, pixelSize);
        } else {
          println("No Mode Selected (Probably a typo)");
        }
        
        updatePixels();
        
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
