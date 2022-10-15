class PixelImage {

  PImage currentImage;
  
  String mode;
  
  int xPos;
  int yPos;
  int widthResolution;
  int heightResolution;
  float pixelSize;

  int[][] pixelList;
  int[][] resizedPixelList;
  String[] characters = {" ", " "," ", ".", "`", "-", "^", "v", "2", "3", "5", "=", "%", "c", "l", "x", "#", "w", "F", "A", "&", "8", "U", "$", "@", "ñ", "■","■", "■", "■"};

  color currentColor;

  int xDraw;
  int yDraw;

  PixelImage() {
  }

  void Add(PImage _currentImage, int _xPos, int _yPos, int _imageWidthResolution, int _imageHeightResolution, float _pixelSize, String _mode) {
    mode = _mode;
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
        
        if (mode == "Characters"){
          fill(1);
          textSize(pixelSize);
          int intDarkness = int(map(resizedPixelList[x][y], 1, 255, characters.length - 1, 0));
          text(characters[intDarkness], xDraw, yDraw);
          
        }
        else{
          fill(resizedPixelList[x][y]);
          rect(xDraw, yDraw, pixelSize, pixelSize);
        }
        
        //Why is set so inefficient??
        
        //for (int i=0; i < pixelSize; i += 1){
        //  for (int j=0; j < pixelSize; j += 1){
        //    set(xDraw + j, yDraw + i, endColor);
        //  }
        //}
        
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
