class Animation {

  boolean isDone;
  int currentFrame = 1;
  int frameAmount;

  int xDraw;
  int yDraw;

  void Play(PixelImage pixelImage, int _frameAmount, int _xPos, int _yPos) {
    frameAmount = _frameAmount;
    noStroke();

    int yStart = currentFrame * (pixelImage.heightResolution / frameAmount);

    for (int y=yStart; y < yStart + (pixelImage.heightResolution / frameAmount); y += 1) {
      for (int x=0; x < pixelImage.widthResolution; x += 1) {
        fill(pixelImage.resizedPixelColor[x][y]);
        rect(xDraw, yDraw, pixelImage.pixelSize, pixelImage.pixelSize);

        xDraw += pixelImage.pixelSize;
      }
      yDraw += pixelImage.pixelSize;
      xDraw = _xPos;
    }
    xDraw = _xPos;
    yDraw = _yPos;

    stroke(1);

    currentFrame += 1;

    if (currentFrame >= frameAmount) {
      isDone = true;
    }
  }
}
