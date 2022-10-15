class PixelVideo {

  boolean videoPlaying;
  int xPos;
  int yPos;
  int Width;
  int Height;
  int pixelSize;

  PixelVideo() {
  }

  void Play(String _video, int _xPos, int _yPos, int _width, int _height, int _pixelSize) {
    xPos= _xPos;
    yPos = _yPos;
    Width = _width;
    Height = _height;
    pixelSize = _pixelSize;

    movie = new Movie(Main.this, _video);
    movie.play();
    videoPlaying = true;
  }

  void Update() {
    if (videoPlaying) {

      movie.read();
      movie.loadPixels();
      currentMovieFrame = movie.copy();
      image(movie, -1000, -1000);

      fill(255);
      rect(xPos, yPos, Width * pixelSize, Height * pixelSize);
      PixelImage.Add(currentMovieFrame, xPos, yPos, Width, Height, pixelSize);
    }
  }
}
